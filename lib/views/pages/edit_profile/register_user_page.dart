import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:withtone/models/user/register.dart';
import 'package:withtone/providers/repositories/register_repository/register_repository.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/learning_community_search.dart';

class ResisterUserPage extends StatefulWidget {
  const ResisterUserPage({super.key});

  static const String path = '/register_user_page';

  @override
  State<ResisterUserPage> createState() => _ResisterUserPageState();
}

class _ResisterUserPageState extends State<ResisterUserPage> {
  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 252,
                ),
                const Text(
                  '名前を作成',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Text(
                  'あとでいつでも変更できます。',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: userNameController,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "名前を入力してください",
                  ),
                  focusNode: FocusNode(),
                  maxLength: 40,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (inputText) {
                    // TODO(ケンティー): 各種バリデーションはちゃんと考えて定義する. 共通化して他の箇所でも利用したい.
                    if (inputText == null || inputText == '') {
                      return '入力してください';
                    }
                    return null;
                  },
                ),
                Center(
                  child: PrimaryButton(
                    label: '登録',
                    onPressed: () async {
                      final uid = FirebaseAuth.instance.currentUser!.uid;
                      final userName = userNameController.text;
                      final register = Register(id: uid, userName: userName);
                      await RegisterRepository.updateRegister(register);
                      // ignore: use_build_context_synchronously
                      await Navigator.pushNamed(
                          context, LeaningCommunitySearch.path);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
