import 'package:good_eats/responses/field_error.dart';


class ResponseStatus {
  int code;
  String message;
  List<FieldError>? errors;

  ResponseStatus({required this.message, required this.code, this.errors});

  ResponseStatus.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        message = json["message"],
        errors = json["errors"] != null ? (json["errors"] as List).map((error) => FieldError.fromJson(error)).toList() : null;

  Map<String, dynamic> toJson() {
    return {'code': code, 'message': message};
  }

  @override
  String toString() => toJson().toString();
}
