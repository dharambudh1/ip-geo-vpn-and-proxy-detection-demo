class VPNAPIErrorResponse {
  VPNAPIErrorResponse({
    this.ip,
    this.message,
  });

  VPNAPIErrorResponse.fromJson(Map<String, dynamic> json) {
    ip = json["ip"];
    message = json["message"];
  }

  String? ip;
  String? message;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["ip"] = ip;
    map["message"] = message;
    return map;
  }
}
