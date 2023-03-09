import '../helpers/custom_trace.dart';

class BookingModel {
  String userid;
  String providerId;
  String categoryId;
  String categoryName;
  String userMobile;
  String subcategoryId;
  String subcategoryName;
  String date;
  String time;
  String address;
  double latitude;
  double longitude;
  String description;
  String service;
  String chargeperhrs;
  int bookingTime;
  String subcategoryImg;
  String providerName;
  String providerMobile;
  String providerImage;
  String status;
  String username;
  String bookId;
  String userRatingStatus;
  String providerRatingStatus;
  bool popStatus = false;

  BookingModel();
  BookingModel.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      userid = jsonMap['userid'];
      providerId = jsonMap['providerId'];
      categoryId = jsonMap['categoryId'];
      categoryName = jsonMap['category_name'];
      subcategoryId = jsonMap['subcategoryId'];
      subcategoryName = jsonMap['subcategory_name'];
      date = jsonMap['date'];
      time = jsonMap['time'];
      address = jsonMap['address'];
      longitude = jsonMap['longitude'];
      latitude = jsonMap['latitude'];
      description = jsonMap['description'];
      service = jsonMap['service'];
      chargeperhrs = jsonMap['chargeperhrs'];
      bookingTime = jsonMap['bookingTime'];
      subcategoryImg = jsonMap['subcategory_img'];
      providerName = jsonMap['providerName'];
      providerMobile = jsonMap['providerMobile'];
      providerMobile = jsonMap['providerMobile'];
      status = jsonMap['status'];
      username = jsonMap['username'];
      bookId = jsonMap['bookId'];
      userRatingStatus = jsonMap['userRatingStatus'];
      providerRatingStatus = jsonMap['providerRatingStatus'];
      userMobile = jsonMap['userMobile'];
      popStatus = jsonMap['popStatus'];
    } catch (e) {
      userid = '';
      providerId = '';
      categoryId = '';
      categoryName = '';
      subcategoryId = '';
      subcategoryName = '';
      longitude = 0.0;
      latitude = 0.0;
      time = '';
      date = '';
      address = '';
      description = '';
      service = '';
      chargeperhrs = '';
      bookingTime = 0;
      subcategoryImg = '';
      providerName = '';
      providerMobile = '';
      providerImage = '';
      status = '';
      username = '';
      bookId = '';
      userRatingStatus = '';
      providerRatingStatus = '';
      userMobile = '';
      popStatus = false;
      print(CustomTrace(StackTrace.current, message: e));
    }
  }
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["userid"] = userid;
    map["providerId"] = providerId;
    map["categoryId"] = categoryId;
    map["categoryName"] = categoryName;
    map["subcategoryId"] = subcategoryId;
    map["subcategoryName"] = subcategoryName;
    map["longitude"] = longitude;
    map["latitude"] = latitude;
    map["time"] = time;
    map["date"] = date;
    map["address"] = address;
    map["description"] = description;
    map["service"] = service;
    map["chargeperhrs"] = chargeperhrs;
    map["bookingTime"] = bookingTime;
    map["subcategoryImg"] = subcategoryImg;
    map["providerName"] = providerName;
    map["providerMobile"] = providerMobile;
    map["providerImage"] = providerImage;
    map["status"] = status;
    map["username"] = username;
    map["bookId"] = bookId;
    map["userRatingStatus"] = userRatingStatus;
    map["providerRatingStatus"] = providerRatingStatus;
    map["userMobile"] = userMobile;
    map['popStatus'] = popStatus;
    return map;
  }
}
