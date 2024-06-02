// import 'package:good_eats/responses/response_status.dart';

// class ResponseData {
//   ResponseStatus status;
//   dynamic data;
//   int? page;
//   int? size;
//   int? total;

//   ResponseData({required this.status, this.data,this.page, this.size, this.total}) : super();

//   ResponseData.fromJson(Map<String, dynamic> json) :
//        status = ResponseStatus.fromJson(json["status"]),
//         data = json["data"],
//   page = json['page'],
//   size = json['size'],
//   total = json['totalElements'];

//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'data': data,
//       'page': page,
//       'size': size,
//       'totalElements': total,
//     };
//   }

//   @override
//   String toString() {
//     return toJson().toString();
//   }
// }

import 'package:good_eats/responses/response_status.dart';

class ResponseData {
  //ResponseStatus status;
  List<dynamic> response;

  ResponseData({required this.response}) : super();

  ResponseData.fromJson(Map<String, dynamic> json) :
       //status = ResponseStatus.fromJson(json["status"]),
        response = json["menuItems"];

  Map<String, dynamic> toJson() {
    return {
      //'status': status,
      'response': response
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

