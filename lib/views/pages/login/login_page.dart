import 'package:flutter/material.dart';
import 'package:withtone/views/components/text_button_zero_padding.dart';
import 'package:withtone/views/learning_community_search.dart';
import 'package:withtone/views/pages/password_reissue/password_reissue_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const String path = '/login';

  final _tab = <Widget>[
    const Padding(
      padding: EdgeInsets.all(12),
      child: Tab(text: 'ログイン'),
    ),
    const Padding(
      padding: EdgeInsets.all(12),
      child: Tab(text: '新規登録'),
    ),
  ];

  /// スタートボタンタップで表示されるログインモーダル
  Widget _loginModal(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: DefaultTabController(
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
                  children: <Widget>[
                    TabBar(
                      tabs: _tab,
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: const Color(0x40ffffff),
                      dividerColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height * 0.67,
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Welcome back',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: double.infinity,
                            child: Text(
                              'メールアドレス',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          TextFormField(
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              hintText: "メールアドレスを入力してください",
                            ),
                            focusNode: FocusNode(),
                            maxLength: 40,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (inputText) {
                              // TODO(ケンティー): 各種バリデーションはちゃんと考えて定義する. 共通化して他の箇所でも利用したい.
                              if (inputText == null || inputText == '') {
                                return '入力してください';
                              } else if (inputText.contains(' ')) {
                                return 'スペースが含まれています';
                              }
                              return null;
                            },
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
                          Column(
                            children: [
                              const Text('パスワードをお忘れですか?'),
                              TextButtonZeroPadding(
                                onPressed: () => Navigator.pushNamed(
                                  context,
                                  PasswordReissuePage.path,
                                ),
                                child: const Text('Reset here'),
                              ),
                            ],
                          ),
                          OutlinedButton(
                            onPressed: () => Navigator.pushNamed(
                              context,
                              LeaningCommunitySearch.path,
                            ),
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
              ),
            ],
          ),
        ),
      ),
    );
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
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            barrierColor: Colors.transparent,
                            builder: _loginModal);
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
