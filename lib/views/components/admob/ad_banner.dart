import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:withtone/views/components/admob/ad_mob.dart';

class AdBanner extends StatefulWidget {
  AdBanner({super.key});

  @override
  State<AdBanner> createState() => _AdBannerState();
}

class _AdBannerState extends State<AdBanner> {
  final AdMob _adMob = AdMob();

  @override
  void initState() {
    super.initState();
    _adMob.load();
  }

  @override
  void dispose() {
    super.dispose();
    _adMob.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AdSize.getAnchoredAdaptiveBannerAdSize(
            Orientation.portrait, MediaQuery.of(context).size.width.truncate()),
        builder: (BuildContext context,
            AsyncSnapshot<AnchoredAdaptiveBannerAdSize?> snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              width: double.infinity,
              child: _adMob.getAdBanner(),
            );
          } else {
            return Container(
              height: _adMob.getAdBannerHeight(),
              color: Colors.white,
            );
          }
        });
  }
}
