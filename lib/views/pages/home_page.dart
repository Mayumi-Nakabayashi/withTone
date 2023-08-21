import 'package:flutter/material.dart';
import 'package:withtone/views/components/kamishibai.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

enum TabItems {
  community(
    title: 'コミュニティ',
    icon: Icons.home,
    page: Kamishibai(
      assetPath: 'assets/page_images/learning community home.png',
      nextPathList: ['/search'],
    ),
  ),

  notifications(
    title: '通知',
    icon: Icons.notifications,
    page: Kamishibai(
      assetPath: 'assets/page_images/notifications.png',
      nextPathList: ['/search'],
    ),
  ),

  upload(
    title: '',
    icon: Icons.add_box_rounded,
    page: Kamishibai(
      assetPath: 'assets/page_images/upload_fb.jpg',
      nextPathList: ['/search'],
    ),
  ),

  content(
    title: '学ぶ',
    icon: Icons.menu_book,
    page: Kamishibai(
      assetPath: 'assets/page_images/content.png',
      nextPathList: ['/search'],
    ),
  ),

  professional(
    title: 'プロ',
    icon: Icons.star,
    page: Kamishibai(
      assetPath: 'assets/page_images/professional.png',
      nextPathList: ['/search'],
    ),
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
  void _sendCurrentTabToAnalytics() {
    analytics.setCurrentScreen(
      screenName: '${HomePage.path}/${_currentTab.name}',
    );
  }
}
