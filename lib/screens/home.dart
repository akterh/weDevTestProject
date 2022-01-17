import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:test_project/data_model/product_response.dart';
import 'package:test_project/my_theme.dart';
import 'package:test_project/repositories/product_repository.dart';
import 'package:test_project/ui_elements/product_card.dart';

class Home extends StatefulWidget {


  @override
   createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ScrollController _productScrollController;
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();






  @override
  void initState(){
    // TODO: implement initState
    super.initState();



  }



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery
        .of(context)
        .padding
        .top;
    //print(MediaQuery.of(context).viewPadding.top);
    List priceList= [];
    List<Products> productResponseList ;

     filterAsPrice ()async{
      productResponseList = await ProductRepository().getProducts();
      for (var i =0;i<=productResponseList.length;i++){
        priceList.add(productResponseList[i].price);
      }
      return productResponseList;


    }



    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: MyTheme.light_grey,
        appBar: buildAppBar(statusBarHeight, context),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          4.0,
                          16.0,
                          8.0,
                          0.0,
                        ),
                        child: buildHomeProducts(context),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 60.0,
        color: Colors.white,
        buttonBackgroundColor: MyTheme.navBarColor,
        backgroundColor: MyTheme.light_grey,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        items: <Widget>[
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.category_outlined, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.account_circle_outlined, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => pages[_page]));
        },
      )
      );

  }

  buildHomeProducts(context) {
    return FutureBuilder(
        future:  ProductRepository().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            /*print("product error");
            print(snapshot.error.toString());*/

            return Container(
              child: Text("error happened"),
            );
          } else if (snapshot.hasData) {
            //snapshot.hasData
            var productResponse = snapshot.data;
            // print(snapshot.data);


            return GridView.builder(

              itemCount: productResponse.length,
              controller: _productScrollController,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.618),
              padding: EdgeInsets.all(8),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // 3
                return ProductCard(

                    name: productResponse[index].name,
                    stroked_price: productResponse[index].regularPrice,
                    id:productResponse[index].id,
                    desc: productResponse[index].shortDescription,
                    image: productResponse[index].images[0].src,
                  main_price: productResponse[index].price,
                  has_discount: true,

                );
              },
            );

          }else{
            return Container(
            );
          }

        }

        );
  }


  AppBar buildAppBar(double statusBarHeight, BuildContext context) {
    return AppBar(
      title: Text("Product List",style: TextStyle(color: Colors.black),),
      centerTitle: true,
      backgroundColor: MyTheme.light_grey,
      elevation: 0,
      // titleSpacing: 50,
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.search,
                size: 26.0,
                color: Colors.black,
              ),
            )
        ),
      ],
    );

  }
}
