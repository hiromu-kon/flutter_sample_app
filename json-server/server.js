const jsonServer = require("json-server");
const fs = require("fs");
const bodyParser = require("body-parser");
const jwt = require("jsonwebtoken");
const helmet = require("helmet");

// JSON Serverで使用するJSONファイルを設定
const server = jsonServer.create();
const router = jsonServer.router("./data.json");
// JSON形式のリクエスト対応
server.use(bodyParser.urlencoded({ extended: true }));
server.use(bodyParser.json());

// 署名
const JWT_SECRET = "jwt_json_server";
// 有効時間
const EXPIRATION = "1h";

// データーベースの作成
const db = JSON.parse(fs.readFileSync("./data.json", "UTF-8"));

/**
 * ログイン
 * 
 */
server.post("/auth/login", (req, resp) => {
  const { email, password } = req.body;

  // ログイン検証
  if (
    db.users.findIndex(
      (user) => user.email === email && user.password === password
    ) === -1
  ) {
    resp.status(401).json({
      'success': false,
      'message': 'Unauthorized',
    });
 
    return;
  }

  // ログイン後、アクセストークンの生成
  const access_token = jwt.sign({ email, password }, JWT_SECRET, {
    expiresIn: EXPIRATION,
  });

  resp.status(200).json({ 
    'success': true,
    'message': '',
    'token': access_token
  });
});

/**
 * 新規登録
 * 
 */
server.post("/auth/register", (req, resp) => {
  const { email, password } = req.body;

  // 新規登録後、アクセストークンの生成
  const access_token = jwt.sign({ email, password }, JWT_SECRET, {
    expiresIn: EXPIRATION,
  });

  resp.status(200).json({
    'success': true,
    'message': '',
    'token': access_token
  });
});

/**
 * ログアウト
 * 
 */
 server.post("/logout", (req, resp) => {

  resp.status(200).json({
    'success': true,
    'message': '',

  });
});


// ②ログイン認証が必要ないルート
// 記事一覧を取得
server.get("/blogs", (req, resp) => {
  const blogs = db.blogs;
  resp.status(200).json({ blogs });
});
// 記事IDから記事を取得
server.get("/blog/:id", (req, resp) => {
  const id = req.params.id;
  const blog = db.blogs.find((blog) => blog.id === Number(id));
  resp.status(200).json({ blog });
});

//③ 認証が必要なルート
server.use((req, resp, next) => {
  // 認証形式チェック
  if (
    req.headers.authorization === undefined ||
    req.headers.authorization.split(" ")[0] !== "Bearer"
  ) {
    // 認証形式が異なる場合
    resp.status(401).json({
      "success": false,
      "message": "Unauthorized",
      "statusCode": 401,
    });
    return;
  }

  // 認証チェック
  try {
    var decode = jwt.verify(
      req.headers.authorization.split(" ")[1],
      JWT_SECRET
    );
    // 認証に成功した場合は、next関数を実行しJSON Serverの機能を利用する
    next();
  } catch (e) {
    // 認証に失敗した場合
    resp.status(401).json({
      "success": false,
      "message": "Unauthorized",
      "statusCode": 401,
    });
  }
});

// JSON Serverを起動する
server.use(router);
server.use(helmet);
server.listen(33000, () => {
  console.log("JSON Server Start");
});
