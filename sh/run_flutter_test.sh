#!/bin/sh

# 前回のテスト結果を削除する
rm -rf coverage
echo 'Removed coverage dir'

# テストを実行する
echo 'Testing flutter_sample_app...'

fvm flutter test --coverage --machine > test-report.log
if [ $? -gt 0 ]; then
  # flutter test でエラーがあれば結果を表示して処理終了
  fvm flutter pub global run dart_dot_reporter test-report.log --show-message
  exit 1
fi
echo 'Tests done!'

# カバレッジ結果のHTMLを出力する
genhtml coverage/lcov.info -o coverage/html

# テスト結果をコンソールに表示する
fvm flutter pub global run dart_dot_reporter test-report.log --show-message

# カバレッジ結果を表示する
open coverage/html/index.html
