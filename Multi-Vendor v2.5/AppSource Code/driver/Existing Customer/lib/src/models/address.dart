import '../helpers/custom_trace.dart';

class Address {
  String id;
  String addressSelect;
  // ignore: slash_for_doc_comments
  double latitude =0;
  double longitude =0;
  String isDefault;
  String username;
  String phone;
  String userId;

  Address();

  Address.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      addressSelect = jsonMap['addressSelect']!= null ? jsonMap['addressSelect'] : '';
     latitude = jsonMap['latitude'].toDouble() != null ? jsonMap['latitude'] : 0;
      longitude = jsonMap['longitude'].toDouble()!=null ? jsonMap['longitude']:0;
      isDefault = jsonMap['is_default']!= null ? jsonMap['isDefault'] : '';
      username = jsonMap['username']!= null ? jsonMap['username'] : '';
      phone = jsonMap['phone']!= null ? jsonMap['phone'] : '';
      userId = jsonMap['userId']!= null ? jsonMap['userId'] : '';
    } catch (e) {
      id = '';
      addressSelect = '';
     // latitude = 0;
     // longitude = 0;
      isDefault = '';
      username = '';
      phone = '';
      userId = '';
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["addressSelect"] = addressSelect;
    map["latitude"] = latitude;
    map["longitude"] = longitude;
    map["isDefault"] = isDefault;
    map["username"] = username;
    map["phone"] = phone;
    map["userId"] = userId;
    return map;
  }
}
