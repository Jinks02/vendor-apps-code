import 'package:flutter/material.dart';
import 'package:multisuperstore/generated/l10n.dart';
import 'package:multisuperstore/src/controllers/product_controller.dart';
import 'package:multisuperstore/src/models/product_details2.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../models/searchisresult.dart';
import 'ClearCartWidget.dart';
import 'ProductsCarouselLoaderWidget.dart';
import 'RestaurantSearchProductBox.dart';
// ignore: must_be_immutable
class AddRestaurantSliderWidget extends StatefulWidget {


  ItemDetails itemData;
  AddRestaurantSliderWidget({Key key, this.itemData}) : super(key: key);

  bool loader;
  @override
  _AddRestaurantSliderWidgetState createState() => _AddRestaurantSliderWidgetState();
}

class _AddRestaurantSliderWidgetState extends StateMVC<AddRestaurantSliderWidget> {

  ProductController _con;
  _AddRestaurantSliderWidgetState() : super(ProductController()) {
    _con = controller;

  }

  @override
  Widget build(BuildContext context) {

    return  widget.itemData.productList.isEmpty
        ? ProductsCarouselLoaderWidget()
        :Container(
      height:155,
        child:ListView.builder(
            shrinkWrap: true,
            itemCount: widget.itemData.productList.length,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            itemBuilder: (context, index) {
              ProductDetails2 _productDetails = widget.itemData.productList.elementAt(index);
              print('not found${ _productDetails.product_name}');

              return

               RestaurantSearchProductBox(choice:_productDetails,
              con: _con,shopId: widget.itemData.vendor.shopId,shopName: widget.itemData.vendor.shopName,
                  subtitle: widget.itemData.vendor.subtitle,km: widget.itemData.vendor.distance,
                  shopTypeID: int.parse(widget.itemData.vendor.shopType),longitude: widget.itemData.vendor.longitude,
              latitude: widget.itemData.vendor.latitude,focusId: int.parse(widget.itemData.vendor.focusType),
              shopDetails: widget.itemData.vendor,);





            }
        ));
  }
  // ignore: non_constant_identifier_names
  void ClearCartShow() {
    var size = MediaQuery.of(context)
        .size;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            height: size.height * 0.3,
            color: Color(0xff737373),
            child: Container(

              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left:size.width * 0.05,right:size.width * 0.05),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ClearCart(),
                            ]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left:size.width * 0.05,right:size.width * 0.05,top: 5, bottom: 5),
                      child:Row(
                        children: [
                          Container(
                            width: size.width * 0.44,
                            height: 45.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.grey[200],
                                    width:1
                                )
                              /*borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))*/
                            ),
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Center(
                                  child: Text(
                                    S.of(context).cancel,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(width:size.width * 0.02),
                          Container(
                            width: size.width * 0.44,
                            height: 45.0,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(30),
                              /*borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))*/
                            ),
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: () {

                                _con.clearCart();
                              },
                              child: Center(
                                  child: Text(
                                    S.of(context).clear_cart,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}


