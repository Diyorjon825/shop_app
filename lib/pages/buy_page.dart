import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:shop_app_ui/pages/home_page.dart';

class BuyPage extends StatefulWidget {
  static const id = 'buy_page';
  Plants info;
  BuyPage({Key? key, required this.info}) : super(key: key);
  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SafeArea(
        child: Column(
          children: [
            _HeadWidget(widget: widget),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.info.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '\$${widget.info.cost}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: RatingStars(
                            value: widget.info.rating,
                            onValueChanged: (v) {
                              setState(() {
                                widget.info.rating =
                                    (widget.info.rating + v) / 2;
                              });
                            },
                            starBuilder: (index, color) => Icon(
                              Icons.star,
                              color: color,
                            ),
                            starCount: 5,
                            starSize: 20,
                            valueLabelColor: const Color(0xff9b9b9b),
                            valueLabelTextStyle: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 12.0,
                            ),
                            valueLabelRadius: 10,
                            maxValue: 5,
                            starSpacing: 2,
                            maxValueVisibility: true,
                            valueLabelVisibility: true,
                            animationDuration: Duration(milliseconds: 1000),
                            valueLabelPadding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 8),
                            valueLabelMargin: const EdgeInsets.only(right: 8),
                            starOffColor: const Color(0xffe7e8ea),
                            starColor: Colors.yellow,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeadWidget extends StatelessWidget {
  const _HeadWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final BuyPage widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        Expanded(
          child: Text(
            widget.info.name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 23, color: Colors.white),
          ),
        ),
        Expanded(
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
