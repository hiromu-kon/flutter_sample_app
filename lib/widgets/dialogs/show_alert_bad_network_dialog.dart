import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter/material.dart';

Future<OkCancelResult> showAlertBadNetworkDialog(
  BuildContext context,
) {
  return showOkAlertDialog(
    context: context,
    title: '情報を取得出来ませんでした。',
    message: '電波状態や接続の安全性など、ご利用の通信環境をご確認の上、再度お試しください。',
  );
}
