class FieldError {
  String field;
  String message;

  FieldError({required this.field, required this.message});

  FieldError.fromJson(Map<String, dynamic> json)
      : field = json["field"],
        message = json["message"];

  Map<String, dynamic> toJson() {
    return {'field': field, 'message': message};
  }

  @override
  String toString() => toJson().toString();
}
