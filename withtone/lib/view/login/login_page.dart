import 'package:flutter/material.dart';
import 'package:withtone/view/password_reissue/password_reissue_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const String path = '/login';

  final _tab = <Widget>[
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Tab(text: 'ログイン'),
    ),
    const Padding(
      padding: EdgeInsets.all(8.0),
      child: Tab(text: '新規登録'),
    ),
  ];

  /// スタートボタンをタップした時の挙動
  void _onPressedStart(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        barrierColor: Colors.transparent,
        builder: (context) {
          return DefaultTabController(
            length: _tab.length,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: Stack(
                alignment: AlignmentDirectional.bottomStart,
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: MediaQuery.of(context).size.height * 0.75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TabBar(
                          tabs: _tab,
                          labelColor: Colors.white,
                          unselectedLabelColor:
                              const Color.fromARGB(64, 255, 255, 255),
                          dividerColor: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Welcome Back'),
                            TextFormField(
                              restorationId: 'life_story_field',
                              focusNode: FocusNode(),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "メールアドレスを入力してください",
                                labelText: "メールアドレス",
                              ),
                            ),
                            TextFormField(
                              restorationId: 'life_story_field',
                              focusNode: FocusNode(),
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "パスワードを入力してください",
                                labelText: "パスワード",
                              ),
                            ),
                            OutlinedButton(
                              onPressed: () =>
                                  Navigator.pushNamed(context, '/content'),
                              child: const Text('ログイン'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                context,
                                PasswordReissuePage.path,
                              ),
                              child: const Text('Reset here'),
                            ),
                            OutlinedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, '/learning_community_search'),
                              child: const Text('新規登録'),
                            ),
                            const Text('OR SIGN IN WITH'),
                            ButtonBar(
                              alignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Text('G'),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Text('F'),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Text('X'),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
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
                  const FlutterLogo(
                    style: FlutterLogoStyle.horizontal,
                    size: 200,
                  ),
                  Text(
                    '音楽ソーシャル学習プラットフォーム',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.53),
                    ),
                  ),
                ],
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 80),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(double.maxFinite),
                        surfaceTintColor: Colors.white,
                        elevation: 20,
                      ),
                      onPressed: () {
                        _onPressedStart(context);
                      },
                      child: const Text(
                        'スタート',
                        style: TextStyle(
                          color: Color(0xff596E79),
                          height: 60 / 18,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
