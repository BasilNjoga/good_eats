import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:good_eats/models/menu_item_response.dart';
import 'package:good_eats/models/response_items.dart';
import 'package:good_eats/responses/response_data.dart';
import 'package:good_eats/responses/response_status.dart';
import 'package:http/http.dart' as http;
import 'package:good_eats/util/constants.dart';
class APIService {

  static Future<MenuItemResponse> getFoodItems() async {
  var response = await _send(Method.get, 'https://api.spoonacular.com/food/menuItems/search?apiKey=8bfa2635dfa24d0c9c463e80f952e9b4&query=50');
  if (response is Map<String, dynamic>) {
    final MenuItemResponse menuItemResponse = MenuItemResponse.fromJson(response);
    return menuItemResponse;
  } else {
    throw Exception('Failed to load menu items');
  }
}

  // static Future getFoodItems() async {
  //   var response = await _send(Method.get, 'https://api.spoonacular.com/food/menuItems/search?apiKey=8bfa2635dfa24d0c9c463e80f952e9b4&query=50');
  //   // if (response is ResponseStatus) {
  //   //   return ResponseData(status: response);
  //   //}
  //   final Map<String, dynamic> jsonData = jsonDecode(response);
  //   final MenuItemResponse menuItemResponse = MenuItemResponse.fromJson(jsonData);

  //   return menuItemResponse;
  //   //return ResponseItems.fromJson(response);
  // }

  static Future<dynamic> _send(Method method, String urlPart, {dynamic data}) async {
  http.Response response ;
  var headers = {
    'Content-Type': 'application/json; charset=utf-8',
  };

  var url = Uri.parse(urlPart);
  debugPrint("headers: $headers");
  debugPrint("${method.name}: $url");

  switch(method) {
    case Method.post:
      debugPrint("data: ${data != null ? json.encode(data) : null}");
      response = await http.post(url, headers: headers, body: data != null ? json.encode(data) : null);
      break;
    case Method.get:
      response = await http.get(url, headers: headers);
      break;
    case Method.delete:
      response = await http.delete(url , headers: headers);
      break;
    case Method.put:
      debugPrint("data: ${data != null ? json.encode(data) : null}");
      response = await http.put(url, headers: headers, body: data != null ? json.encode(data) : null);
      break;
    case Method.formData:
      var request = http.MultipartRequest('POST', url);
      request.headers.addAll(headers);
      for (var entry in data!.entries) {
        if (entry.value is File) {
          var file = entry.value as File;
          var filePart = http.MultipartFile.fromBytes(
            entry.key, await file.readAsBytes(),
            filename: file.path);
          request.files.add(filePart);
        } else {
          request.fields[entry.key] = entry.value;
        }
      }
      response = await http.Response.fromStream(await request.send());
  }
  debugPrint("status: ${response.statusCode}, response: ${response.body}");
  if (response.statusCode == 200) {
    return jsonDecode(response.body); // Return the decoded JSON directly
  } else if (response.statusCode == 400) {
    return ResponseStatus.fromJson(jsonDecode(response.body));
  } else {
    String error = "";
    switch (response.statusCode) {
      case 404:
        error = "Resource cannot be found";
        break;
      case 401:
        error = "Please login to access this resource";
        break;
      case 403:
        error = "You are not authorised to access this resource";
        break;
      default:
        return Future.error(HttpException("$error (${response.statusCode})"));
    }
  }
}

  // static Future<dynamic> _send(Method method, String urlPart,
  // {dynamic data}) async {
  //   http.Response response ;
  //   var headers = {
  //     'Content-Type': 'application/json; charset=utf-8',
  //   };

  //   var url = Uri.parse('$baseURL$urlPart');
  //   debugPrint("headers: $headers");
  //   debugPrint("${method.name}: $url");

  //   switch(method) {
  //     case Method.post:
  //     debugPrint("data: ${data != null ? json.encode(data) : null}");
  //     response = await http.post(url, headers: headers, body: data != null ? json.encode(data) : null);
  //     break;
  //     case Method.get:
  //     response = await http.get(url, headers: headers);
  //     break;
  //     case Method.delete:
  //     response = await http.delete(url , headers: headers);
  //     break;
  //     case Method.put:
  //     debugPrint("data: ${data != null ? json.encode(data) : null}");
  //     response = await http.put(url, headers: headers, body: data != null ? json.encode(data) : null);
  //     break;
  //     case Method.formData:
  //     var request = http.MultipartRequest('POST', url);
  //     request.headers.addAll(headers);
  //     for (var entry in data!.entries) {
  //       if (entry.value is File) {
  //         var file = entry.value as File;
  //         var filePart = http.MultipartFile.fromBytes(
  //           entry.key, await file.readAsBytes(),
  //           filename: file.path);
  //           request.files.add(filePart);
  //       } else {
  //         request.fields[entry.key] = entry.value;
  //       }
        
  //     }
  //     response = await http.Response.fromStream(await request.send());
  //   }
  //   debugPrint("status: ${response.statusCode}, response: ${response.body}");
  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else if (response.statusCode == 400) {
  //     return ResponseStatus.fromJson(jsonDecode(response.body));
  //   } else {
  //     String error = "";
  //     switch (response.statusCode) {
  //       case 404:
  //         error = "Resource cannot be found";
  //         break;
  //       case 401:
  //         error = "Please login to access this resource";
  //         break;
  //       case 403:
  //         error = "You are not authorised to access this resource";
  //         break;
  //         default:
  //           return Future.error(HttpException("$error (${response.statusCode})"));
  //     }
  //   }

  // }
}