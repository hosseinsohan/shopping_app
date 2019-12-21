import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'detail_page.dart';
import 'initialize.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "فروشگاه آنلاین",
      home: Directionality(
        // add this
        textDirection: TextDirection.rtl, // set this property
        child: HomePage(),
      ),
    ));


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentPage(),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TopBanner(),
        CostumNavigationBar(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 104,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                QuickNavigationBar(),
                TitleBar(),
                ProductMenu(),
                BottomTitleBar(),
                CarouselMenu(),
                SizedBox(height: 10,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class TopBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 8,
      color: mainColor,
    );
  }
}

class CostumNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32),
      margin: EdgeInsets.only(top: 32),
      width: MediaQuery.of(context).size.width,
      height: 64,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            top: 20,
            child: Image.asset(
              'assets/icons/shopping-bag.png',
              width: 24,
            ),
          ),
          Positioned(
            right: 0,
            top: 20,
            child: Image.asset(
              'assets/icons/menu.png',
              width: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class QuickNavigationBar extends StatefulWidget {
  @override
  _QuickNavigationBarState createState() => _QuickNavigationBarState();
}

class _QuickNavigationBarState extends State<QuickNavigationBar> {
  List<MenuItemClass> sampleData = new List<MenuItemClass>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new MenuItemClass(true, "assets/icons/lamp.png"));
    sampleData.add(new MenuItemClass(false, "assets/icons/sofa.png"));
    sampleData.add(new MenuItemClass(false, "assets/icons/window.png"));
    sampleData.add(new MenuItemClass(false, "assets/icons/table.png"));
    sampleData.add(new MenuItemClass(false, "assets/icons/armchair.png"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: sampleData.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? 32 : 0, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  new InkWell(
                    splashColor: mainColor,
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                    onTap: () {
                      setState(() {
                        sampleData
                            .forEach((elemebt) => elemebt.isSelected = false);
                        sampleData[index].isSelected = true;
                      });
                    },
                    child: new MenuItem(sampleData[index]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class MenuItemClass {
  bool isSelected;
  String imagePath;

  MenuItemClass(this.isSelected, this.imagePath);
}

class MenuItem extends StatelessWidget {
  final MenuItemClass _item;

  MenuItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: _item.isSelected ? mainColor.withOpacity(0.8) : Colors.transparent,
                blurRadius: 10,
                spreadRadius: 0)
          ],
          borderRadius: BorderRadius.circular(32),
          color: _item.isSelected ? mainColor : menuColor),
      child: Center(
        child: new Image.asset(
          _item.imagePath,
          width: 32,
          color: _item.isSelected ? Colors.white : mainColor,
        ),
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 64,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 18,
            right: 32,
            child: RichText(
              text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: 'لامپ - ',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, color: mainColor)),
                    new TextSpan(
                        text: 'لامپ رومیزی',
                        style: new TextStyle(
                            fontWeight: FontWeight.normal, color: mainColor))
                  ]),
            ),
          ),
          SeeAllButton()
        ],
      ),
    );
  }
}

class SeeAllButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 15,
      top: 24,
      child: InkWell(
        onTap: () {
          print("کلیک");
        },
        child: Row(
          children: <Widget>[
            Text(
              'دیدن همه',
              style: TextStyle(fontSize: 14.0, color: mainColor),
            ),
            Icon(
              Icons.keyboard_arrow_left,
              color: mainColor,
            )
          ],
        ),
      ),
    );
  }
}

class ProductItemClass {
  bool isSelected;
  Color itemColor;
  String imagePath, price, title, propertiesText;

  ProductItemClass(this.isSelected, this.itemColor, this.imagePath, this.title,
      this.price, this.propertiesText);
}

class ProductCard extends StatelessWidget {
  ProductItemClass _item;

  ProductCard(this._item);

  @override
  Widget build(BuildContext context) {
    Radius myValue = Radius.circular(5);
    Radius myLargValue = Radius.circular(50);
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: 280,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: _item.isSelected ? mainColor : Colors.transparent,
                blurRadius: 10),
          ],
          color: _item.itemColor,
          borderRadius: BorderRadius.only(
              topRight: myValue,
              topLeft: myValue,
              bottomRight: myValue,
              bottomLeft: myLargValue)),
      child: Stack(
        children: <Widget>[
          Positioned(
              left: 24,
              bottom: 24,
              child: Icon(
                Icons.add_circle,
                color: Colors.white,
              )),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Image.asset(
                _item.imagePath,
                width: 140,
              )),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    _item.price,
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
              SizedBox(height: 4),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    _item.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )),
              SizedBox(height: 4),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    _item.propertiesText,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductMenu extends StatefulWidget {
  @override
  _ProductMenuState createState() => _ProductMenuState();
}

class _ProductMenuState extends State<ProductMenu> {
  List<ProductItemClass> sampleData = new List<ProductItemClass>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add(new ProductItemClass(
        true,
        mainColor,
        "assets/products/hanginglight.png",
        "نور آویزان",
        "917000 تومان",
        "ظریف"));
    sampleData.add(new ProductItemClass(
        true,
        secondColor,
        "assets/products/desklamp.png",
        "لامپ رومیزی",
        "780000 تومان",
        "کلاسیک"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 280,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: sampleData.length,
          itemBuilder: (context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                  right: index == 0 ? 32 : 0, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  new InkWell(
                    onTap: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (contetx)=> DetailPage()));
                    },
                    splashColor: sampleData[index].itemColor,
                    child: Row(
                      children: <Widget>[
                        ProductCard(sampleData[index]),
                        SizedBox(
                          width: 24,
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class BottomTitleBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 64,
      color: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 18,
            right: 32,
            child: RichText(
              text: new TextSpan(
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    new TextSpan(
                        text: 'لوازم جانبی - ',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold, color: mainColor)),
                    new TextSpan(
                        text: 'لامپ',
                        style: new TextStyle(
                            fontWeight: FontWeight.normal, color: mainColor))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselMenu extends StatefulWidget {
  @override
  _CarouselMenuState createState() => _CarouselMenuState();
}

class _CarouselMenuState extends State<CarouselMenu> {
  List<String> sampleData = new List<String>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sampleData.add("assets/accesories/ac1.jpg");
    sampleData.add("assets/accesories/ac2.jpg");
    sampleData.add("assets/accesories/ac3.jpg");
    sampleData.add("assets/accesories/ac4.jpg");
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      enlargeCenterPage: true,

      height: 160.0,
      items: sampleData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    '$i',
                    fit: BoxFit.cover,
                  )),
            );
          },
        );
      }).toList(),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
