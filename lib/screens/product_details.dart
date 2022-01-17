import 'package:flutter/material.dart';
import 'package:test_project/my_theme.dart';
import 'dart:ui';
import 'package:test_project/custom/toast_component.dart';
import 'package:toast/toast.dart';


class ProductDetails extends StatefulWidget {
 String id;
 String name;
 String price;
 String desc;
 String image;

  ProductDetails({Key key, this.id,this.name,this.price,this.image,this.desc}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {





  @override
  Widget build (BuildContext context) {


    return Scaffold(

        backgroundColor: Colors.white,
        appBar: buildAppBar(),
        body: Column(
            children:[
              buildProductImageSection(),

              SizedBox(
                height: 16,
              ),

              Text(
               "${widget.name}",
                style: TextStyle(
                    fontSize: 16,
                    color: MyTheme.font_grey,
                    fontWeight: FontWeight.w600),
                maxLines: 2,
              ),
              SizedBox(
                height: 16,
              ),



           Text(
             "${widget.desc}"
           ),
              SizedBox(
                height: 16,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      width: 30,
                      child: Text(
                        "Price:",
                        style: TextStyle(color: Color.fromRGBO(153, 153, 153, 1)),
                      ),
                    ),
                  ),

                  Text(
                    "${widget.price} TK",
                    style: TextStyle(
                        color: MyTheme.accent_color,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
              SizedBox(
                height: 16,
              ),
              FlatButton(
                minWidth: MediaQuery.of(context).size.width / 2 - .3,
                height: 50,
                color: MyTheme.accent_color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Text(
                  "Buy Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  ToastComponent.showDialog("${widget.price} TK", context,
                      gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);

                },
              )



            ],
          ),
        );
  }



  AppBar buildAppBar() {
    return AppBar(
      title:  Text(
       "Product Details",
        style: TextStyle(fontSize: 16, color: MyTheme.font_grey),
      ),
   centerTitle: true,
    );
  }

  buildProductImageSection() {

      return Stack(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Container(
                width: double.infinity,
                child:Image.network('${widget.image}')),
          ),
        ],
      );
    }
  }