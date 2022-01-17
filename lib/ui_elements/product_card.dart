import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:test_project/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:test_project/screens/product_details.dart';

class ProductCard extends StatefulWidget {

  int id;
  String image;
  String name;
  String main_price;
  String stroked_price;
  bool has_discount;
  String desc;

  ProductCard({Key key,this.id, this.image, this.name, this.main_price,this.stroked_price,this.has_discount,this.desc}) : super(key: key);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    print((MediaQuery.of(context).size.width - 48 ) / 2);
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetails(desc:widget.desc,name: widget.name,price: widget.main_price,image: widget.image,);
        }));
      },
      child: Card(
        //clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(16.0),
        ),
        shadowColor: MyTheme.medium_grey,

        elevation: 5,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  width: double.infinity,
                  //height: 158,
                  height: (( MediaQuery.of(context).size.width - 28 ) / 2) + 2,
                  child: ClipRRect(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16), bottom: Radius.zero),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/images/dokan.png',
                        image:  widget.image,
                        fit: BoxFit.cover,
                      ))),
              Container(
                height: 90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                      child: Text(
                        widget.desc,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            color: MyTheme.font_grey,
                            fontSize: 14,
                            height: 1.2,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      children: [

                        widget.has_discount ? Padding(
                          padding: EdgeInsets.fromLTRB(16, 14, 16, 0),
                          child: Text("\$"+
                            widget.stroked_price,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                decoration:TextDecoration.lineThrough,
                                color: MyTheme.medium_grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ):Container(),
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 14, 16, 0),
                          child: Text("\$"+
                            widget.main_price,
                            textAlign: TextAlign.left,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600),
                          ),
                        ),

                      ],

                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16,top: 8,),
                      child: RatingBarIndicator(
                        rating: 2.75,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 14,
                        direction: Axis.horizontal,
                      ),
                    ),




                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
