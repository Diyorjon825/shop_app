import 'package:flutter/material.dart';

import 'main_page.dart';

class BuyPage extends StatefulWidget {
  Plants plant;
  static const id = 'buy_page';
  BuyPage({Key? key, required this.plant}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.plant.name),
        ],
      ),
    );
  }
}
