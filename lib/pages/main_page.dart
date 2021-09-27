import 'package:flutter/material.dart';
import 'package:shop_app_ui/pages/search_page.dart';
import 'package:shop_app_ui/pages/shop_page.dart';
import 'package:shop_app_ui/resources/resources.dart';
import 'home_page.dart';

const String info =
    ' "ILDIS LegumeWeb entry for Alexa". International Legume Database & Information Service. Cardiff School of Computer Science & Informatics. Retrieved 30 January 2014.USDA; ARS; National Genetic Resources Program. "GRIN species records of Alexa". Germplasm Resources Information Network—(GRIN) [Online Database]. National Germplasm Resources Laboratory, Beltsville, Maryland. Archived from the original on 24 September 2015. Retrieved 30 January 2014.';

class Plants {
  String image, name, cost, info;
  double rating;
  Plants(this.image, this.name, this.cost, this.rating, this.info);
}

final List<Plants> plants = [
  Plants(Images.areka, 'Arexa', '20.8', 3.3, info),
  Plants(Images.faux, 'Faux', '10', 4.1, info),
  Plants(Images.fejka, 'Fejka', '15', 4.8, info),
  Plants(Images.foleage, 'Foleage', '30', 3.9, info),
  Plants(Images.monstera, 'Monstera', '30', 4.2, info),
  Plants(Images.monsteraAfrican, 'Monstera African', '25', 3.1, info),
  Plants(Images.nearlyNatural, 'Nearly Natural', '35', 5, info),
  Plants(Images.pileya, 'Pileya', '23', 4.2, info),
  Plants(Images.temezlik, 'Temezlik', '20', 3.5, info),
];

class MainPage extends StatefulWidget {
  final id = 'main_page';
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

int current = 0;

class _MainPageState extends State<MainPage> {
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
      const ShopPage(),
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
