import 'package:flutter/material.dart';
import 'package:wahid/core/constant/image_assets.dart';

class LogoAuth extends StatelessWidget {
  LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImageAsset.logoImage,
      height: 170,
    );
  }
}
