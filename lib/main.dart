import 'package:flutter/material.dart';
import 'package:shop_app_ui/pages/buy_page.dart';
import 'package:shop_app_ui/pages/search_page.dart';

import 'pages/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MainPage(),
      routes: {
        const SearchPage().id: (context) => const SearchPage(),
      },
    );
  }
}
