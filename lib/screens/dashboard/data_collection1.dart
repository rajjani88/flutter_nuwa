import 'package:flutter/material.dart';
import 'package:flutter_nuwa/commons/common_btn.dart';
import 'package:flutter_nuwa/commons/my_app_bar.dart';
import 'package:flutter_nuwa/screens/dashboard/data_collection_stylus.dart';
import 'package:flutter_nuwa/utils/app_colors.dart';
import 'package:get/route_manager.dart';

class DataCollection1 extends StatefulWidget {
  const DataCollection1({super.key});

  @override
  State<DataCollection1> createState() => _DataCollection1State();
}

class _DataCollection1State extends State<DataCollection1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const MyAppBar(),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "Data Collection",
                style: TextStyle(
                    fontSize: 40, color: mBlack, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Text(
                    "Select what pen are you using for writing?",
                    style: TextStyle(
                        fontSize: 30,
                        color: mBlack,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            CommonBtn(
              lable: "Using stylus",
              onTap: () {
                Get.to(() => const DataCollectionStylus());
              },
            ),
            const Spacer(),
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
