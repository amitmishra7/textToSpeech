import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:text_to_speech/models/categories.dart';
import 'package:text_to_speech/models/items.dart';

class ItemsPage extends StatefulWidget {
  Categories categories;

  ItemsPage(this.categories);

  @override
  _ItemsPageState createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {

  FlutterTts flutterTts;

  /// Allowed values are in the range from 0.0 (silent) to 1.0 (loudest)
  double volume = 1;

  /// 1.0 is default and ranges from .5 to 2.0
  double pitch = 1.0;

  /// Allowed values are in the range from 0.0 (slowest) to 1.0 (fastest)
  double rate = 0.5;
  bool isCurrentLanguageInstalled = false;

  bool get isAndroid => !kIsWeb && Platform.isAndroid;

  List<Items> items;

  @override
  initState() {
    super.initState();
    initTts();
    items = widget.categories.items;
  }

  initTts() {
    flutterTts = FlutterTts();
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(widget.categories.name),
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: new Icon(Icons.arrow_back_ios),
              ),
            ),
            backgroundColor: Colors.white,
            body:  buildBody()));
  }

  /// display the body of the page
  Widget buildBody(){
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(items.length, (index) {
        return Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: InkWell(
                    onTap: () {
                      speakText(items[index].name);
                    },
                    child: Image.asset(items[index].image)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  items[index].name,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  /// method to convert text to speech
  Future speakText(String text) async {
    stop();
    await flutterTts.setVolume(volume);
    await flutterTts.setSpeechRate(rate);
    await flutterTts.setPitch(pitch);

    await flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(text);
  }

  /// stop existing speech
  Future stop() async {
    await flutterTts.stop();
  }

}
