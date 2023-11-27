# withtone

音楽人生に新しい選択肢を。
世界中の音楽仲間とつながろう

<img src="./assets/docs/withtone_hero.jpg" width="640">

withTone は音楽ソーシャル学習プラットフォームです。  
楽器を演奏する人々が自分にとって居心地の良いコミュニティが見つけられず、
音楽を気軽に続けることができない、という課題があります。
withTone は世界中の音楽仲間と簡単につながることができ、
お互いに学び合いながら気軽に音楽を続けられるような環境を実現します。

## サポートプラットフォーム

ios, android のモバイル端末. 
どこまでのバージョンをサポートするかは話し合ってません.

Google Play ストア, App Store での配布を準備中です.

iPad のようなタブレットは現状対応しません (対応したいが後回し).
web も現状対応しません.

## 開発

### 開発ツール

以下のツールを利用します.
★ のついたツールは招待必須なので, まだの方はメンバーに声をかけて加入してください.

- Flutter 大学 (Slack に join する為に加入必須)
- github (コード置き場, Issue 管理)
- Figma (デザイン置き場)
- ★ Firebase (バックエンドの提供やログの収集)
- ★ Slack (メンバー同士のコミュニケーション)
- ★ Confluence (議事録や要件定義)
- Google meet (週一のMTGや画面共有が必要なコミュニケーション)

開発にあたって, 言語やパッケージのバージョンを揃えます.

| 名前 | バージョン | 備考 |
| --- | --- | --- |
| Flutter | 3.10.6 | fvm などで バージョンを合わせる |
| 各種 pub パッケージ | pubspec.yaml で管理, pubspec.lock でメンバー全員のバージョンを固定. 定期的に最新版にアップデートする | パッケージのインストールは `flutter pub get` を実行する |


参考までに, ken-ty の `flutter doctor` の結果
```
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.10.6, on macOS 12.6 21G115 darwin-x64, locale ja-JP)
[✓] Android toolchain - develop for Android devices (Android SDK version 33.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 14.2)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2021.3)
[✓] VS Code (version 1.81.1)
[✓] Connected device (2 available)
[✓] Network resources
```

### アーキテクチャ

バックエンドは Firebase, アプリは Flutter で開発.
ディレクトリ構成などはまだ決まってない.
状態管理は Riverpod を利用する.

### ブランチ運用

`git-flow` を採用する. 一旦頻出するブランチのみ列挙する.

| ブランチ名 | 役割 |
| --- | --- |
| main | 本番環境と同じ. このブランチでは作業しない. |
| develop | 開発用ブランチ. このブランチでは作業しない. |
| feature | 作業ブランチ. develop から分岐し, develop にマージする. |

### commit message

commit message の書き方をある程度揃え, レビューの負荷軽減を図る.

[Angular の規約](https://github.com/angular/angular/blob/68a6a07/CONTRIBUTING.md#-commit-message-format) に則ったフォーマットで,
prefix は [commitizen](cz-conventional-changelog-ja) に従う.
頻出する prefix は以下.

```
feat:     新機能
fix:      バグ修正
docs:     ドキュメントのみの変更
refactor: リファクタリングのための変更（機能追加やバグ修正を含まない）
chore:    その他の変更（ソースやテストの変更を含まない）
```

`git log` で過去の commit message を参考にしたり, [commit message で TTNE する方法](https://zenn.dev/ken_ty/articles/417f58aaa67ec3) を参考にしてください.

###  便利なコマンド集

| コマンド | できること |
| --- | --- |
| `open ios/Runner.xcworkspace/` | Runner を Xcode で起動する |

## これから join する / したい あなたへ

withTone は随時メンバーを募集してます！
興味のある方はメンバーに「参加したい！」と声を掛けてください。

楽しく開発しましょう!!
テスト
