import 'package:flutter/material.dart';
import 'package:flutter_nuwa/screens/dashboard/data_collection_cont.dart';
import 'package:flutter_nuwa/screens/dashboard/views/mypainter.dart';
import 'package:flutter_nuwa/utils/app_colors.dart';
import 'package:flutter_nuwa/utils/app_img.dart';
import 'package:get/get.dart';

class WordExperimentView extends StatefulWidget {
  const WordExperimentView({super.key});

  @override
  State<WordExperimentView> createState() => _WordExperimentViewState();
}

class _WordExperimentViewState extends State<WordExperimentView> {
  List<String> wordList = ["Lorem", "Apple", "Goodness"];
  List<Offset> points = []; // List to store touch points
  List<List<Offset>> strokes =
      []; // List of strokes (each stroke is a list of points)

  DataCollectionCont dataCollectionCont = Get.put(DataCollectionCont());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Text(
              "Word Experiment",
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
                          child: Text(
                            dataCollectionCont.wordList[0],
                            style: TextStyle(
                                fontSize: 30,
                                color: mBlack,
                                fontWeight: FontWeight.w600),
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
            SizedBox(
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
                              CustomPaint(
                                size: Size(MediaQuery.of(context).size.width,
                                    MediaQuery.of(context).size.height),
                                painter: MyPainter(dataCollectionCont.strokes),
                              ),
                              GestureDetector(
                                onPanStart: (details) {
                                  dataCollectionCont.strokes.add([]);
                                  setState(() {});
                                },
                                onPanUpdate: (details) {
                                  print(details);
                                  dataCollectionCont.strokes.last
                                      .add(details.localPosition);
                                },
                                child: Container(
                                  color: Colors
                                      .transparent, // Make container invisible
                                  height: double
                                      .infinity, // Cover the entire screen
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
        ));
  }
}
