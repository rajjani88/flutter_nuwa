import 'package:flutter/material.dart';
import 'package:flutter_nuwa/commons/common_btn.dart';
import 'package:flutter_nuwa/commons/my_app_bar.dart';
import 'package:flutter_nuwa/screens/dashboard/data_collection1.dart';
import 'package:flutter_nuwa/utils/app_colors.dart';
import 'package:get/route_manager.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
                "Data Collection and Testing Tool",
                style: TextStyle(
                    fontSize: 40, color: mBlack, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            CommonBtn(
              lable: "Data Collection",
              onTap: () {
                Get.to(() => const DataCollection1());
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
