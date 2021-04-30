# Text to Speech

A small demonstration of `flutter_tts` to convert text to speech.

Hey guys! Today we are going to learn about how to convert **text to speech** in flutter. Sounds interesting. Isn't it? Indeed!. Let's dive more into it.


        #flutter_tts
        #“A flutter text to speech plugin (Swift,Java)”

To make it more interesting, we are creating an app for kids. It will display list of various items like animals, birds, fruits etc. They can click on items to hear their names and learn . Just a small app only for demonstration. No high expectations please. Haha!

Lets begin!!!

We will be using the a lot of images. You can find them in the assets folder.

## Step 1 :  Install Packages

Place the below dependencies in your `pubspec.yaml` file and run `flutter pub get`
```dart
  
  flutter_tts: ^3.0.0
  
```

## Step 2 : Add Model Classes

Create the 1st model class file as `items.dart`

```dart
class Items{
  String name;
  String image;
  Items({this.name, this.image});
}
```

Create another model class which holds this model class as `categories.dart`

```dart
import 'package:text_to_speech/models/items.dart';

class Categories {
  String name;
  String image;
  List<Items> items;
  Categories({this.name, this.image,this.items});
}
```

## Step 3 : Adding Data

`constants.dart` is responsible for making rest api calls.

```dart
import 'package:text_to_speech/models/categories.dart';
import 'package:text_to_speech/models/items.dart';

class Constants {
  static final List<Items> animals = [
    Items(name: "Lion", image: "assets/images/categories/animals/lion.jpg"),
    Items(name: "Tiger", image: "assets/images/categories/animals/tiger.jpg"),
    Items(name: "Cow", image: "assets/images/categories/animals/cow.jpg"),
    Items(name: "Buffalo", image: "assets/images/categories/animals/buffalo.jpg"),
    Items(name: "Elephant", image: "assets/images/categories/animals/elephant.jpg"),
    Items(name: "Giraffe", image: "assets/images/categories/animals/giraffe.jpg")
  ];
  static final List<Items> birds = [
    Items(name: "Crow", image: "assets/images/categories/birds/crow.jpg"),
    Items(name: "Pigeon", image: "assets/images/categories/birds/pigeon.jpg"),
    Items(name: "Sparrow", image: "assets/images/categories/birds/sparrow.jpg"),
    Items(name: "Owl", image: "assets/images/categories/birds/owl.jpg"),
    Items(name: "Eagle", image: "assets/images/categories/birds/eagle.jpg"),
    Items(name: "Peacock", image: "assets/images/categories/birds/peacock.jpg")
  ];
  static final List<Items> fruits = [
    Items(name: "Apple", image: "assets/images/categories/fruits/apple.jpg"),
    Items(name: "Mango", image: "assets/images/categories/fruits/mango.jpg"),
    Items(name: "Banana", image: "assets/images/categories/fruits/banana.jpg"),
    Items(name: "Grapes", image: "assets/images/categories/fruits/grapes.jpg"),
    Items(name: "Pear", image: "assets/images/categories/fruits/pear.jpg"),
    Items(name: "Pineapple", image: "assets/images/categories/fruits/pineapple.jpg")
  ];
  static final List<Items> vegetables = [
    Items(name: "Potato", image: "assets/images/categories/vegetables/potato.jpg"),
    Items(name: "Onion", image: "assets/images/categories/vegetables/onion.jpg"),
    Items(name: "Tomato", image: "assets/images/categories/vegetables/tomato.jpg"),
    Items(name: "Brinjal", image: "assets/images/categories/vegetables/brinjal.jpg"),
    Items(name: "Carrot", image: "assets/images/categories/vegetables/carrot.jpg"),
    Items(name: "Pumpkin", image: "assets/images/categories/vegetables/pumpkin.jpg")
  ];
  static final List<Items> flowers = [
    Items(name: "Rose", image: "assets/images/categories/flowers/rose.jpg"),
    Items(name: "Lotus", image: "assets/images/categories/flowers/lotus.jpg"),
    Items(name: "Lily", image: "assets/images/categories/flowers/lily.jpg"),
    Items(name: "Marigold", image: "assets/images/categories/flowers/marigold.jpg"),
    Items(name: "Tulip", image: "assets/images/categories/flowers/tulip.jpg"),
    Items(name: "Hibiscus", image: "assets/images/categories/flowers/hibiscus.jpg")
  ];
  static final List<Items> vehicles = [
    Items(name: "Aeroplane", image: "assets/images/categories/vehicles/aeroplane.jpg"),
    Items(name: "Helicopter", image: "assets/images/categories/vehicles/helicopter.jpg"),
    Items(name: "Bus", image: "assets/images/categories/vehicles/bus.jpg"),
    Items(name: "Train", image: "assets/images/categories/vehicles/train.jpg"),
    Items(name: "Motor Car", image: "assets/images/categories/vehicles/motorcar.jpg"),
    Items(name: "Bicycle", image: "assets/images/categories/vehicles/bicycle.jpg")
  ];

  static final List<Categories> categories = [
    Categories(name: "Animals", image: "assets/images/categories/animals.jpg", items: animals),
    Categories(name: "Birds", image: "assets/images/categories/birds.jpg", items: birds),
    Categories(name: "Fruits", image: "assets/images/categories/fruits.jpg", items: fruits),
    Categories(name: "Vegetables", image: "assets/images/categories/vegetables.jpg", items: vegetables),
    Categories(name: "Flowers", image: "assets/images/categories/flowers.jpg", items: flowers),
    Categories(name: "Vehicles", image: "assets/images/categories/vehicles.jpg", items: vehicles)
  ];
}

```

## Step 4 : Create Home UI

`home_page.dart` be the home page of our app.

```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_to_speech/screens/items_page.dart';
import 'package:text_to_speech/util/constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Kids Learn'),
            ),
            backgroundColor: Colors.white,
            body: buildBody()));
  }
  
  Widget buildBody(){
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(Constants.categories.length, (index) {
        return Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                ItemsPage(Constants.categories[index]),
                          ));
                    },
                    child:
                    Image.asset(Constants.categories[index].image)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Constants.categories[index].name,
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
}
```

On our home page we are displaying a grid of categories from constants i.e. animals, birds, fruits, vegetables, flowers and vehicles along with their images.

## Step 5 : Items page

`items_page.dart` displays the actual items which on clicked convert the name of item to speech.

```dart
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
```

Here focus on the method `speakText()` which is the heart of our app. It uses the `FlutterTts` to convert speech to text using the method `flutterTts.speak(text)`.
There are other attributes of FlutterTts as mentioned below.

**Volume** - It is controlled by `flutterTts.setVolume(volume)`. Allowed values are in the range from 0.0 (silent) to 1.0 (loudest)
**Rate** - It is controlled by `flutterTts.setSpeechRate(rate)`. Allowed values are in the range from .5 to 2.0 and 1.0 is default
**Pitch** - It is controlled by `flutterTts.setPitch(pitch)`. Allowed values are in the range from 0.0 (slowest) to 1.0 (fastest)

There is one more method used above, `flutterTts.stop()` which is used to stop an ongoing speech. We have used it before speaking so that the user is always able to hear the last clicked item without any ambiguity or delay.

That's it folks! We're done with all the coding. Just go ahead and run your app!

Fantastic!! You have just learned how to convert text to speech using `flutter_tts`.

## Important:

This repository is only for providing information on `flutter_tts`. Please do not misuse it.

## Author:

* [Amit Mishra](https://github.com/amitmishra7)

If you like this tutorial please don't forget to add a **Star**. Also follow to get informed for upcoming tutorials.
