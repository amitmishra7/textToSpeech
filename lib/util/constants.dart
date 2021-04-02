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
