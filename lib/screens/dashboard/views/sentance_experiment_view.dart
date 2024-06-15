import 'package:flutter/material.dart';
import 'package:flutter_nuwa/screens/dashboard/data_collection_cont.dart';
import 'package:flutter_nuwa/screens/dashboard/views/mypainter.dart';
import 'package:flutter_nuwa/utils/app_colors.dart';
import 'package:flutter_nuwa/utils/app_img.dart';
import 'package:get/get.dart';

class SentanceCollectionStylus extends StatefulWidget {
  const SentanceCollectionStylus({super.key});

  @override
  State<SentanceCollectionStylus> createState() =>
      _SentanceCollectionStylusState();
}

class _SentanceCollectionStylusState extends State<SentanceCollectionStylus> {
  List<Offset> points = []; // List to store touch points
  List<List<Offset>> strokes =
      []; // List of strokes (each stroke is a list of points)

  DataCollectionCont dataCollectionCont = Get.put(DataCollectionCont());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Sentence Experiment",
          style: TextStyle(
              fontSize: 32, color: mBlack, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            height: 140,
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: mBoxGray,
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          dataCollectionCont.sentanceList[0],
                          style: TextStyle(
                              fontSize: 30,
                              color: mBlack,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {
                      dataCollectionCont.changeWord();
                    },
                    icon: Image.asset(
                      AppImg.imgGreenTick,
                      height: 80,
                      width: 80,
                    ))
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
        Text(
          "Please write below:",
          style: TextStyle(
              fontSize: 22, color: mBlack, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SizedBox(
            height: 290,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: mBlack)),
                      child: Stack(
                        children: [
                          // Custom Painting to draw the user's strokes
                          CustomPaint(
                            size: Size(MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height),
                            painter: MyPainter(dataCollectionCont.strokes),
                          ),

                          GestureDetector(
                            onPanStart: (details) {
                              dataCollectionCont.strokes.add([]);
                            },
                            onPanUpdate: (details) {
                              dataCollectionCont.strokes.last
                                  .add(details.localPosition);
                            },
                            onPanEnd: (details) {
                              setState(() {});
                            },
                            child: Container(
                              color: Colors.transparent,
                              height: double.infinity,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
