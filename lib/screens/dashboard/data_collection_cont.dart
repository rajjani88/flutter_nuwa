import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataCollectionCont extends GetxController {
  RxList<String> wordList = <String>["Lorem", "Apple", "Goodness"].obs;
  RxList<Offset> points = <Offset>[].obs; // List to store touch points
  RxList<List<Offset>> strokes =
      <List<Offset>>[].obs; // List of strokes (each stroke is a list of points)

  RxList<String> sentanceList = <String>[
    "I even copied her one-line paragraphs.",
    "He was way above one-line soundbites.",
    "And a one-line recipe was all it took."
  ].obs;

  void changeWord() {
    wordList.shuffle();
    sentanceList.shuffle();
    points.clear();
    strokes.clear();
  }
}
