import 'package:good_eats/models/image_item.dart';

const baseURL = '';

enum Method {
  post,
  get,
  delete,
  put,
  formData
}

final menu = [
  ImageItem(code: "account", name: "Account", image: "images/ic_user.png"),
  ImageItem(code: "log_out", name: "Log out", image: "images/ic_logout.png"),
];