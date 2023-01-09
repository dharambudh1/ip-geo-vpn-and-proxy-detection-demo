class IPGeolocationResponse {
  IPGeolocationResponse({
    this.ip,
    this.location,
    this.domains,
    this.as,
    this.isp,
    this.proxy,
  });

  IPGeolocationResponse.fromJson(Map<String, dynamic> json) {
    ip = json["ip"];
    location =
        json["location"] != null ? Location.fromJson(json["location"]) : null;
    domains = json["domains"] != null
        ? (json["domains"] as List<dynamic>).cast<String>()
        : <String>[];
    as = json["as"] != null ? As.fromJson(json["as"]) : null;
    isp = json["isp"];
    proxy = json["proxy"] != null ? Proxy.fromJson(json["proxy"]) : null;
  }

  String? ip;
  Location? location;
  List<String>? domains;
  As? as;
  String? isp;
  Proxy? proxy;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["ip"] = ip;
    if (location != null) {
      map["location"] = location?.toJson();
    }
    map["domains"] = domains;
    if (as != null) {
      map["as"] = as?.toJson();
    }
    map["isp"] = isp;
    if (proxy != null) {
      map["proxy"] = proxy?.toJson();
    }
    return map;
  }
}

class Proxy {
  Proxy({
    this.proxy,
    this.vpn,
    this.tor,
  });

  Proxy.fromJson(Map<String, dynamic> json) {
    proxy = json["proxy"];
    vpn = json["vpn"];
    tor = json["tor"];
  }

  bool? proxy;
  bool? vpn;
  bool? tor;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["proxy"] = proxy;
    map["vpn"] = vpn;
    map["tor"] = tor;
    return map;
  }
}

class As {
  As({
    this.asn,
    this.name,
    this.route,
    this.domain,
    this.type,
  });

  As.fromJson(Map<String, dynamic> json) {
    asn = json["asn"];
    name = json["name"];
    route = json["route"];
    domain = json["domain"];
    type = json["type"];
  }

  int? asn;
  String? name;
  String? route;
  String? domain;
  String? type;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["asn"] = asn;
    map["name"] = name;
    map["route"] = route;
    map["domain"] = domain;
    map["type"] = type;
    return map;
  }
}

class Location {
  Location({
    this.country,
    this.region,
    this.city,
    this.lat,
    this.lng,
    this.postalCode,
    this.timezone,
    this.geonameId,
  });

  Location.fromJson(Map<String, dynamic> json) {
    country = json["country"];
    region = json["region"];
    city = json["city"];
    lat = json["lat"];
    lng = json["lng"];
    postalCode = json["postalCode"];
    timezone = json["timezone"];
    geonameId = json["geonameId"];
  }

  String? country;
  String? region;
  String? city;
  double? lat;
  double? lng;
  String? postalCode;
  String? timezone;
  int? geonameId;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["country"] = country;
    map["region"] = region;
    map["city"] = city;
    map["lat"] = lat;
    map["lng"] = lng;
    map["postalCode"] = postalCode;
    map["timezone"] = timezone;
    map["geonameId"] = geonameId;
    return map;
  }
}
