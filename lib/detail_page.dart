import 'package:flutter/material.dart';
import 'initialize.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,

      child: Column(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 260,
            decoration: BoxDecoration(
                color: mainColor,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100))),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Image.asset(
                    'assets/products/hanginglight.png',
                    width: 240,
                  ),
                ),
                Positioned(
                  right: 32,
                  top: 64,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      child: Image.asset(
                        'assets/icons/left-arrow.png',
                        color: Colors.white,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 32,
                  top: 64,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/shopping-bag.png',
                          color: Colors.white,
                          width: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/icons/heart.png',
                          color: Colors.white,
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: 8,
                height: MediaQuery.of(context).size.height-192,
                color: mainColor,
              ),
              Container(
                width: MediaQuery.of(context).size.width-8,
                height: MediaQuery.of(context).size.height-192,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width-8,
                        height: 60,
                        child: Stack(
                          children: <Widget>[
                            Text(
                              "ظریف\nروشنایی لامپ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                  fontSize: 16,
                                  fontFamily: 'MagnumSansMedium'),
                            ),
                            Positioned(
                                top: 12,
                                left: 0,
                                child: Text(
                                  "917000 تومان",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: mainColor,
                                      fontFamily: 'MagnumSansBold'),
                                ))
                          ],
                        ),
                      ),
                      PropertiesList(),
                      Container(
                        width: MediaQuery.of(context).size.width-8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'توضیحات',
                              style: TextStyle(color: mainColor, fontSize: 18),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'کاربرد: دانش آموزی\nجنس بدنه: فلز، پلاستیک، لاستیک \nنوع گردنی: انعطاف‌پذیر ',
                              style: TextStyle(
                                  color: mainColor, fontSize: 15, height: 1.4),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      BuyNowButton()
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}

class PropertiesList extends StatefulWidget {
  @override
  _PropertiesListState createState() => _PropertiesListState();
}

class _PropertiesListState extends State<PropertiesList> {
  List<ProductItemClass> sampleData = new List<ProductItemClass>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new ProductItemClass(
        "در عرض چند دقیقه", "نصب سریع", "assets/icons/clock.png"));
    sampleData.add(new ProductItemClass(
        "شامل پایه", "متعلقات", "assets/icons/idea.png"));
    sampleData.add(new ProductItemClass(
        "انواع مختلف", "رنگ", "assets/icons/paint-palette.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-8,
      height: (MediaQuery.of(context).size.width-8) / 3 - 23,
      margin: EdgeInsets.only(top: 20),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sampleData.length,
          itemBuilder: (context, int index) {
            return Container(
              margin: EdgeInsets.only(
                  right: index == 0 ? 10 : 1,
                  left: index == sampleData.length - 1 ? 10 : 1),
              width: (MediaQuery.of(context).size.width-8) / 3 - 23,
              height: (MediaQuery.of(context).size.width-8) / 3 - 23,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: mainColor)),
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      sampleData[index].description,
                      style: TextStyle(fontSize: 9),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      sampleData[index].title,
                      style:
                          TextStyle(fontFamily: 'MagnumSansBold', fontSize: 12),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Image.asset(
                      sampleData[index].imagePath,
                      color: mainColor,
                      width: 32,
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class ProductItemClass {
  String description, title, imagePath;

  ProductItemClass(this.description, this.title, this.imagePath);
}

class BuyNowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-8,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: mainColor),
      child: Center(
        child: Text(
          'خرید',
          style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'MagnumSansExtraLight'),
        ),
      ),
    );
  }
}
