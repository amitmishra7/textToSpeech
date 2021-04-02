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
