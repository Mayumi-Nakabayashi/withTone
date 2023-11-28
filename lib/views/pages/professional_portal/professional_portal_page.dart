import 'package:flutter/material.dart';
import 'package:withtone/views/components/border_widget.dart';
import 'package:withtone/views/components/circle_profile_icon.dart';
import 'package:withtone/views/components/dot.dart';
import 'package:withtone/views/pages/article/article_page.dart';
import 'package:withtone/views/pages/edit_profile/edit_profile_page.dart';
import 'package:withtone/views/pages/professional_tool/professional_tool_page.dart';
import 'package:withtone/views/pages/profile/counter.dart';
import 'package:withtone/views/pages/profile/item_view.dart';
import 'package:withtone/views/pages/profile/profile_button.dart';
import 'package:withtone/views/pages/setting/setting_page.dart';

import 'dart:math' as math; //testでかいた　いらなかったら削除

/// プロフェッショナルポータルページ
class ProfessionalPortalPage extends StatefulWidget {
  const ProfessionalPortalPage({super.key});

  static const String path = '/professional_portal';

  @override
  State<ProfessionalPortalPage> createState() => _ProfessionalPortalPageState();
}

//こっから削除した

class Commit {
  int count;

  Commit(this.count);
}

class _ProfessionalPortalPageState extends State<ProfessionalPortalPage> {
  // 日にちごとのコミット回数を格納する用
  List<Commit> commit = [];

  @override
  void initState() {
    // 現在の日付データを取得
    DateTime dt = DateTime.now();
    // dt.weekday : 曜日を数字で取得できる。(月:1, 火:2, 水:3, 木:4, 金:5, 土:6, 日:7)
    int weekDay = dt.weekday + 1;

    for (int i = 0; i < 7 * weekDay; i++) {
      commit.add(Commit(math.Random().nextInt(10)));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GitHubのcontributionsグラフUI',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 130,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // 曜日
                    children: [
                      Spacer(flex: 3),
                      Text('Mon'),
                      Spacer(flex: 2),
                      Text('Wed'),
                      Spacer(flex: 2),
                      Text('Fri'),
                      Spacer(flex: 3),
                    ],
                  ),
                ),
                Expanded(
                  flex: 11,
                  child: Center(
                    child: GridView.builder(
                      itemCount: commit.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 7,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4,
                      ),
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (BuildContext context, int i) {
                        return Container(
                          decoration: BoxDecoration(
                            color: buildColor(commit[i].count),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color? buildColor(int count) {
    if (count == 0) {
      return Colors.grey[300];
    } else if (count <= 2) {
      return Colors.green[200];
    } else if (count <= 4) {
      return Colors.green[400];
    } else if (count <= 6) {
      return Colors.green[600];
    } else {
      return Colors.green[800];
    }
  }
}