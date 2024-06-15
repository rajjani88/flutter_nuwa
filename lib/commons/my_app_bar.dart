import 'package:flutter/material.dart';
import 'package:flutter_nuwa/utils/app_colors.dart';
import 'package:flutter_nuwa/utils/app_img.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return //appbar
        Container(
      height: 66,
      color: mBlack,
      child: Stack(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  AppImg.imgMenu,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                height: 56,
                AppImg.imgLogo,
                color: mWhite,
              )
            ],
          )
        ],
      ),
    );
  }
}
