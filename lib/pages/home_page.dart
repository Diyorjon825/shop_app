import 'package:flutter/material.dart';
import 'package:shop_app_ui/pages/buy_page.dart';
import 'package:shop_app_ui/resources/resources.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final List<Plants> plants = [
  Plants(Images.areka, 'Arexa', '20', 3.3),
  Plants(Images.faux, 'Faux', '10', 4.1),
  Plants(Images.fejka, 'Fejka', '15', 4.8),
  Plants(Images.foleage, 'Foleage', '30', 3.9),
  Plants(Images.monstera, 'Monstera', '30', 4.2),
  Plants(Images.monsteraAfrican, 'Monstera African', '25', 3.1),
  Plants(Images.nearlyNatural, 'Nearly Natural', '35', 5),
  Plants(Images.pileya, 'Pileya', '23', 4.2),
  Plants(Images.temezlik, 'Temezlik', '20', 3.5),
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Text(
            'All Plants',
            style: TextStyle(color: Colors.white),
          ),
        )),
        Expanded(
          flex: 30,
          child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 0.9,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: plants.length,
              itemBuilder: (BuildContext ctx, index) {
                return productWidget(index);
              }),
        ),
      ],
    );
  }

  Widget productWidget(int index) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(plants[index].image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        plants[index].name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        '\$ ${plants[index].cost}',
                        style: const TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BuyPage(
                          info: plants[index],
                        )),
              );
            },
          ),
        )
      ],
    );
  }
}

class Plants {
  String image, name, cost;
  double rating;
  Plants(this.image, this.name, this.cost, this.rating);
}
