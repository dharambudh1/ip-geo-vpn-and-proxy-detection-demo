class ErrorResponse {
  ErrorResponse({
    this.code,
    this.messages,
  });

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    code = json["code"];
    messages = json["messages"];
  }

  int? code;
  String? messages;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["code"] = code;
    map["messages"] = messages;
    return map;
  }
}
