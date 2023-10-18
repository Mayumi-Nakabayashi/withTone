import 'package:flutter/material.dart';
import 'package:withtone/views/components/border_widget.dart';
import 'package:withtone/views/pages/account_delete/pop_button.dart';
import 'package:withtone/views/pages/account_delete/title_text_widget.dart';

class AccountStopdeleteDeletePage extends StatefulWidget {
  const AccountStopdeleteDeletePage({super.key});
  static const String path = '/account_stopdelete_delete_page';

  @override
  State<AccountStopdeleteDeletePage> createState() =>
      _AccountStopdeleteDeletePageState();
}

class _AccountStopdeleteDeletePageState
    extends State<AccountStopdeleteDeletePage> {
  String removeReason = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const PopButton(),
                  const SizedBox(height: 32),
                  const TitleTextWidget(title: 'withToneを退会する理由を教えてください'),
                  const SizedBox(height: 11),
                  const SizedBox(
                    width: 340,
                    child: Text(
                      'withToneのコミュニティサポートやアプリの改善に役立てられるようご意見をお聞かせください。',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 19),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '一時的に退会したい',
                              style: TextStyle(fontSize: 12),
                            ),
                            Radio(
                                value: '一時的に退会したい',
                                groupValue: removeReason,
                                onChanged: (value) {
                                  setState(() {
                                    removeReason = value!;
                                  });
                                })
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: BorderWidget(
                          color: Color(
                            0xffD0D1D3,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '無関係な広告が多い',
                              style: TextStyle(fontSize: 12),
                            ),
                            Radio(
                                value: '無関係な広告が多い',
                                groupValue: removeReason,
                                onChanged: (value) {
                                  setState(() {
                                    removeReason = value!;
                                  });
                                })
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: BorderWidget(
                          color: Color(
                            0xffD0D1D3,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'その他の理由',
                              style: TextStyle(fontSize: 12),
                            ),
                            Radio(
                                value: 'その他の理由',
                                groupValue: removeReason,
                                onChanged: (value) {
                                  setState(() {
                                    removeReason = value!;
                                  });
                                })
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: BorderWidget(
                          color: Color(
                            0xffD0D1D3,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 55),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 325,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: const Color(0xff005792)),
                        child: const Text(
                          '続ける',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
