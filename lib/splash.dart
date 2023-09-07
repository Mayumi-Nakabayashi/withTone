import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:withtone/views/pages/home_page.dart';
import 'package:withtone/views/pages/intro/intro_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  static const String path = '/splash';
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.wait([_checkAuth()]);
    super.initState();
  }

  Future<void> _checkAuth() async {
    // await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 2));
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (mounted) {
        await Navigator.pushNamed(context, IntroPage.path);
      }
      return;
    }

    if (mounted) {
      await Navigator.pushNamed(context, HomePage.path);
    }
  }
}
