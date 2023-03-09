import '../helpers/custom_trace.dart';
import 'addon2.dart';

class CartResponce {
  String id;
  // ignore: non_constant_identifier_names
  String product_name;
  String price;
  String strike;
  int offer;
  String quantity;
  int qty;
  String color;
  String colorName;
  String variant;
  String variantValue;
  String userId;
  String cartId;
  String unit;
  String shopId;
  String image;
  List<Addon2Model> addon = <Addon2Model>[];

  CartResponce();

  CartResponce.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      product_name = jsonMap['product_name']!= null ? jsonMap['product_name'] : '';
      price = jsonMap['price']!= null ? jsonMap['price'] : '';
      strike = jsonMap['strike']!= null ? jsonMap['strike'] : '';
      offer = jsonMap['offer']!= null ? jsonMap['offer'] : '';
      quantity = jsonMap['quantity']!= null ? jsonMap['quantity'] : '';
      qty = jsonMap['qty']!= null ? jsonMap['qty'] : '';
      userId = jsonMap['userId']!= null ? jsonMap['userID'] : '';
      cartId = jsonMap['cartId']!= null ? jsonMap['cartId'] : '';
      color = jsonMap['color']!= null ? jsonMap['color'] : '';
      colorName = jsonMap['colorName']!= null ? jsonMap['colorName'] : '';
      variant = jsonMap['variant']!= null ? jsonMap['variant'] : '';
      variantValue = jsonMap['variantValue']!= null ? jsonMap['variantValue'] : '';
      unit = jsonMap['unit']!= null ? jsonMap['unit'] : '';
      shopId = jsonMap['shopId']!= null ? jsonMap['shopId'] : '';
      image = jsonMap['image']!= null ? jsonMap['image'] : '';
      addon = jsonMap['addon'] != null ? List.from(jsonMap['addon']).map((element) => Addon2Model.fromJSON(element)).toList() : [];

    } catch (e) {
      print('error cart');
      id = '';
      product_name = '';
      price = '';
      strike = '';
      offer = 0;
      quantity ='';
      qty = 1;
      userId = '';
      cartId = '';
      color = '';
      colorName = '';
      variant = '';
      variantValue = '';
      unit = '';
      shopId = '';
      addon = [];
      image = '';
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": product_name,
    "price": price,
    "strike": strike,
    "offer": offer,
    "qty": qty,
    "color": color,
    "quantity": quantity,
    "colorName": colorName,
    "variant": variant,
    "variantValue": variantValue,
    "userId": userId,
    "cartId": cartId,
    "unit": unit,
    "shopId": shopId,
    "image": image,
  };

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["product_name"] = product_name;
    map["price"] = price;
    map["strike"] = strike;
    map["offer"] = offer;
    map["quantity"] = quantity;
    map["qty"] = qty;
    map["color"] = color;
    map["colorName"] = colorName;
    map["variant"] = variant;
    map["variantValue"] = variantValue;
    map["userId"] = userId;
    map["cartId"] = cartId;
    map["unit"] = unit;
    map["shopId"] = shopId;
    map["image"] = image;
    map["addon"] = addon?.map((element) => element.toMap())?.toList();
    return map;
  }
}
