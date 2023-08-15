import 'package:flutter/material.dart';
import 'package:withtone/views/pages/intro/login_modal_content.dart';
import 'package:withtone/views/pages/intro/signup_modal_content.dart';

/// IntroPage の 引数
///
/// 画面遷移時に arguments に渡すことができる.
///
/// ```
/// Navigator.pushNamed(
///   context,
///   IntroPage.path,
///   arguments: IntroPageArguments(showModal: true),
/// );
/// ```
class IntroPageArguments {
  /// スタートボタン押す前からモーダルを表示したいなら true を指定する.
  final bool showModal;
  IntroPageArguments({this.showModal = false});
}

/// 最初に表示されるページ
class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  static const String path = '/intro';

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  /// タブに表示するラベル
  final _tab = <Widget>[
    const Tab(text: 'ログイン', height: 60),
    const Tab(text: '新規登録', height: 60),
  ];
  // ラベルのtextStyle tabBar で指定する
  final _labelStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  final _tabHeight = 60;

  /// 初期化処理をしたかどうか
  /// context を利用する初期処理は initState に書けないので, flag を見る
  bool untilInitProcess = true;

  @override
  Widget build(BuildContext context) {
    // 画面遷移時の引数を受け取る
    final args =
        ModalRoute.of(context)?.settings.arguments as IntroPageArguments?;

    // 自動でモーダル表示するか
    // build で1度のみ処理が通るように untilInitProcess でガードする.
    final autoShowModal = untilInitProcess && (args?.showModal ?? false);

    /// スタートボタンタップで表示されるモーダル
    Widget startModalBuilder(BuildContext context) {
      // 一旦, 各モーダルの画面高さのパーセントで計算する
      final double whiteModalHeight = MediaQuery.of(context).size.height * 0.75;
      final double blueModalHeight = whiteModalHeight + _tabHeight;
      // モーダルの角丸
      Widget modalRounder(Widget child) {
        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: child,
        );
      }

      return modalRounder(
        DefaultTabController(
          length: _tab.length,
          child: Builder(builder: (context) {
            // statelessWidget で tabController を使う
            // 参考: https://qiita.com/Ayuu_N/items/7f077fd65beccb599d9a
            final tabController = DefaultTabController.of(context);
            return SizedBox(
              height: blueModalHeight,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    height:
                        MediaQuery.of(context).size.height * blueModalHeight,
                    child: Column(
                      children: <Widget>[
                        TabBar(
                          tabs: _tab,
                          labelStyle: _labelStyle,
                          labelColor: Colors.white,
                          unselectedLabelColor: const Color(0x40ffffff),
                          dividerColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  modalRounder(
                    Container(
                      color: Colors.white,
                      height: whiteModalHeight,
                      child: SizedBox(
                        width: double.infinity,
                        child: TabBarView(
                          controller: tabController,
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(40, 40, 40, 4),
                              child: LoginModalContent(),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(40, 40, 40, 4),
                              child: SignupModalContent(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      );
    }

    // 引数でモーダル表示の指定があるなら, スタートボタン押す前から表示しておく.
    // 1度のみ処理が通るように untilInitProcess も利用する.
    if (autoShowModal) {
      // ビルド後に呼び出さないとエラーになるので, ビルド後のコールバックで呼ぶ
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // 即座に表示するとiOSの遷移時アニメーションが崩れているように見えるので,
        // 0.3s まつ
        Future.delayed(const Duration(milliseconds: 300), () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            barrierColor: Colors.transparent,
            builder: startModalBuilder,
          );
          setState(() => untilInitProcess = false);
        });
      });
    }
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.primary,
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(),
                Column(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Image.asset('assets/logo/mainlogo.png'),
                    ),
                    Text(
                      '音楽ソーシャル学習プラットフォーム',
                      style: TextStyle(color: Colors.white.withOpacity(0.53)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size.fromWidth(double.maxFinite),
                              backgroundColor: const Color(0xffffffff),
                              foregroundColor: const Color(0xff596E79),
                              surfaceTintColor: const Color(0xffffffff),
                              elevation: 20,
                            ),
                            onPressed: autoShowModal
                                ? null
                                : () => showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      barrierColor: Colors.transparent,
                                      builder: startModalBuilder,
                                    ),
                            child: const Text(
                              'スタート',
                              style: TextStyle(
                                height: 60 / 18,
                                fontWeight: FontWeight.w800,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      'dev版 v0.0.1(99)',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
