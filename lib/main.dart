import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Column(
            children: [
              containerBorder(
                child: Row(
                  children: [
                    Expanded(
                      child: containerBorder(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5),
                              child: Text("Nội dung 1"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 5, bottom: 5, left: 5),
                              child: Text("Nội dung 2"),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Icon(Icons.stacked_bar_chart),
                    Text("AAA")
                  ],
                ),
              ),
              TextField(
                controller: textEditingController,
                keyboardType: TextInputType.number,
              ),
              TextButton(
                  onPressed: () {
                    log(textEditingController.text);
                    if (int.parse(textEditingController.text) > 0) {
                      convertNumber(int.parse(textEditingController.text));
                    }
                  },
                  child: Text("button"))
            ],
          ),
        ));
  }

  Widget containerBorder({required Widget child, double? width}) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red, width: 2)),
      child: child,
    );
  }

  convertNumber(int number) {
    ///1000đ
    ///100000đ
    ///1230000đ
    ///100đ
    ///
    ///1.000đ
    ///100.000đ
    ///1.230.000đ
    ///100đ
    ///
    ///
    String result = "";
    double numberTemp = 0;

    if (number > 1000) {
      numberTemp = number / 1000;
    }
    return result;
  }
}
