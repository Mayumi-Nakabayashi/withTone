import 'package:flutter/material.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/learning_community_search.dart';

/// ユーザー名を登録する画面
class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  static const String path = '/register_user';

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 100),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  '名前を作成',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  '後でいつでも変更できます',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ),
              TextFormField(
                controller: userNameController,
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: "木村なつみ",
                ),
                focusNode: FocusNode(),
                maxLength: 40,
                autovalidateMode: AutovalidateMode.onUserInteraction,
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
              const SizedBox(height: 40), // 適当な余白
              PrimaryButton(
                  label: '次へ',
                  onPressed: () async {
                    await Navigator.pushNamed(
                      context,
                      LeaningCommunitySearch.path,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
