import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:withtone/views/components/lottie/single_shot_lottie.dart';
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
        child: const SafeArea(
          child: Center(
            child: SingleShotLottie(
              asset: 'assets/logo/animelogo.json',
              size: 300,
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
    //  await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 5));
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (mounted) {
        await Navigator.pushReplacementNamed(context, IntroPage.path);
      }
      return;
    }

    if (mounted) {
      await Navigator.pushReplacementNamed(context, HomePage.path);
    }
  }
}
