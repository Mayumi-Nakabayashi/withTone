import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:withtone/views/components/primary_button.dart';
import 'package:withtone/views/learning_community_search.dart';
import 'package:withtone/views/pages/edit_profile/model/register.dart';

import '../../../providers/firebase_provider/firebase_auth_provider.dart';
import '../edit_profile/provider/profile_provider.dart';

class ResisterUserPage extends ConsumerStatefulWidget {
  const ResisterUserPage({super.key});

  static const String path = '/register_user';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResisterUserPageState();
}

final userNameController = TextEditingController();

class _ResisterUserPageState extends ConsumerState<ResisterUserPage> {
  @override
  void dispose() {
    userNameController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
                    final uid = ref.read(uidProvider);
                    if (uid == null) {
                      return;
                    }
                    final userName = userNameController.text;
                    final register = Register(id: uid, userName: userName);
                    await ref.read(registerReference).add(register);
                    if (mounted) {
                      await Navigator.pushNamed(
                        context,
                        LeaningCommunitySearch.path,
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
