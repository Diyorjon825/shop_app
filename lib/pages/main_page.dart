import 'package:flutter/material.dart';
import 'package:shop_app_ui/pages/search_page.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int current = 0;
  final List<String> namePages = ['Home', 'Search', 'Shopping', 'Profile'];
  @override
  Widget build(BuildContext context) {
    void bottomNavigationBarOnTap(int i) {
      setState(() {
        current = i;
      });
    }

    List<Widget> pages = [
      const HomePage(),
      const SearchPage(),
    ];
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        title: Text(
          namePages[current],
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: pages[current],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'My Shops',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        onTap: bottomNavigationBarOnTap,
        currentIndex: current,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
