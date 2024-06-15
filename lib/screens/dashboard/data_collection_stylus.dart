import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_nuwa/commons/common_btn.dart';
import 'package:flutter_nuwa/commons/my_app_bar.dart';
import 'package:flutter_nuwa/screens/dashboard/views/sentance_experiment_view.dart';
import 'package:flutter_nuwa/screens/dashboard/views/word_experiment_view.dart';
import 'package:flutter_nuwa/utils/app_colors.dart';
import 'package:flutter_nuwa/utils/app_img.dart';

enum StylusType {
  all,
  word,
  sentence,
}

class DataCollectionStylus extends StatefulWidget {
  const DataCollectionStylus({super.key});

  @override
  State<DataCollectionStylus> createState() => _DataCollectionStylusState();
}

class _DataCollectionStylusState extends State<DataCollectionStylus> {
  bool isConnected = false;

  StylusType stylusType = StylusType.all;
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        setState(() {
          isConnected = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const MyAppBar(),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Text(
                    "Data Collection : Using stylus",
                    style: TextStyle(
                        fontSize: 36,
                        color: mBlack,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Stack(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 160,
                        child: Image.asset(
                          AppImg.imgStylusPen,
                          height: 80,
                          width: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: Text(
                          isConnected ? "Connected" : "Connecting...",
                          style: TextStyle(
                              fontSize: 18,
                              color: mBlack,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
            ),
            Expanded(
              child: stylusType == StylusType.all
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonBtn(
                          lable: "Word",
                          onTap: () {
                            setState(() {
                              stylusType = StylusType.word;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CommonBtn(
                          lable: "Sentence",
                          onTap: () {
                            setState(() {
                              stylusType = StylusType.sentence;
                            });
                          },
                        ),
                      ],
                    )
                  : stylusType == StylusType.word
                      ? const WordExperimentView()
                      : stylusType == StylusType.sentence
                          ? const SentanceCollectionStylus()
                          : const SizedBox(),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "NUWA PEN B.V.",
                style: TextStyle(
                    fontSize: 18, color: mBlack, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
