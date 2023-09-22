import 'dart:developer';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:withtone/views/pages/content/content_page.dart';
import 'package:withtone/views/pages/learning_community_home/learning_community_home_page.dart';
import 'package:withtone/views/pages/notifications/notifications_page.dart';
import 'package:withtone/views/pages/professional/professional_page.dart';
import 'package:withtone/views/pages/upload_fb.dart';

enum TabItems {
  community(
    title: 'コミュニティ',
    icon: Icons.home,
    page: LearningCommunityHomePage(),
  ),

  notifications(
    title: '通知',
    icon: Icons.notifications,
    page: NotificationsPage(),
  ),

  upload(
    title: '',
    icon: Icons.add_box_rounded,
    page: UploadFbPage(),
  ),

  content(
    title: '学ぶ',
    icon: Icons.menu_book,
    page: ContentPage(),
  ),

  professional(
    title: 'プロ',
    icon: Icons.star,
    page: ProfessionalPage(),
  );

  const TabItems({
    required this.title,
    required this.icon,
    required this.page,
  });

  final String title;
  final IconData icon;
  final Widget page;
}

class HomePage extends StatefulWidget {
  const HomePage(this.analytics, this.observer, {super.key});

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  static const String path = '/home';

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin, RouteAware {
  TabItems _currentTab = TabItems.content;

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> initPlugin() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await Future.delayed(const Duration(milliseconds: 200));
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }

  @override
  void initState() {
    super.initState();
    // Can't show a dialog in initState, delaying initialization
    WidgetsBinding.instance.addPostFrameCallback((_) => initPlugin());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.observer.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    widget.observer.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _sendCurrentTabToAnalytics();
  }

  @override
  void didPopNext() {
    _sendCurrentTabToAnalytics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _currentTab.page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentTab.index,
        selectedItemColor: const Color(0xff161722),
        unselectedItemColor: const Color(0xff8A8B8F),
        selectedFontSize: 9,
        unselectedFontSize: 9,
        items: TabItems.values
            .map(
              (tabItem) => BottomNavigationBarItem(
                icon: Icon(tabItem.icon),
                label: tabItem.title,
              ),
            )
            .toList(),
        onTap: (index) {
          onSelect(TabItems.values[index]);
        },
      ),
    );
  }

  void onSelect(TabItems selectedTab) {
    setState(() {
      _currentTab = selectedTab;
      _sendCurrentTabToAnalytics();
    });
  }

  /// 現在の tab の screenName を analytics に設定する
  Future<void> _sendCurrentTabToAnalytics() async {
    final screenName = '${HomePage.path}/${_currentTab.name}';
    await analytics.setCurrentScreen(screenName: screenName);
    log(name: 'transition', screenName);
  }
}
