import 'package:flutter/material.dart';
import 'package:shop_app_ui/pages/home_page.dart';
import 'package:shop_app_ui/pages/main_page.dart';

import 'manuai_info_widget.dart';

class SearchPage extends StatefulWidget {
  final id = 'search_page';
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

var findPlants = <Plants>[];

class _SearchPageState extends State<SearchPage> {
  final textController = TextEditingController();
  void searchPlants() {
    final text = textController.text;
    if (text.isNotEmpty) {
      findPlants = plants
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
      setState(() {});
    } else {
      findPlants = plants;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    findPlants = plants;
    textController.addListener(searchPlants);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.only(top: 75),
          itemCount: findPlants.length,
          itemExtent: 153,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                              image: DecorationImage(
                                image: AssetImage(findPlants[index].image),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                            color: Colors.black38,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                findPlants[index].name,
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '\$${findPlants[index].cost}',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(15),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ManualInfoWidget(
                              info: findPlants[index],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: TextField(
            controller: textController,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.blueGrey[700]?.withAlpha(230),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: const OutlineInputBorder(),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                  color: Colors.teal,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
