class VPNAPISuccessResponse {
  VPNAPISuccessResponse({
    this.ip,
    this.security,
    this.location,
    this.network,
    this.message,
  });

  VPNAPISuccessResponse.fromJson(Map<String, dynamic> json) {
    ip = json["ip"];
    security =
        json["security"] != null ? Security.fromJson(json["security"]) : null;
    location =
        json["location"] != null ? Location.fromJson(json["location"]) : null;
    network =
        json["network"] != null ? Network.fromJson(json["network"]) : null;
    message = json["message"];
  }

  String? ip;
  Security? security;
  Location? location;
  Network? network;
  String? message;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["ip"] = ip;
    if (security != null) {
      map["security"] = security?.toJson();
    }
    if (location != null) {
      map["location"] = location?.toJson();
    }
    if (network != null) {
      map["network"] = network?.toJson();
    }
    map["message"] = message;
    return map;
  }
}

class Network {
  Network({
    this.network,
    this.autonomousSystemNumber,
    this.autonomousSystemOrganization,
  });

  Network.fromJson(Map<String, dynamic> json) {
    network = json["network"];
    autonomousSystemNumber = json["autonomous_system_number"];
    autonomousSystemOrganization = json["autonomous_system_organization"];
  }

  String? network;
  String? autonomousSystemNumber;
  String? autonomousSystemOrganization;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["network"] = network;
    map["autonomous_system_number"] = autonomousSystemNumber;
    map["autonomous_system_organization"] = autonomousSystemOrganization;
    return map;
  }
}

class Location {
  Location({
    this.city,
    this.region,
    this.country,
    this.continent,
    this.regionCode,
    this.countryCode,
    this.continentCode,
    this.latitude,
    this.longitude,
    this.timeZone,
    this.localeCode,
    this.metroCode,
    this.isInEuropeanUnion,
  });

  Location.fromJson(Map<String, dynamic> json) {
    city = json["city"];
    region = json["region"];
    country = json["country"];
    continent = json["continent"];
    regionCode = json["region_code"];
    countryCode = json["country_code"];
    continentCode = json["continent_code"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    timeZone = json["time_zone"];
    localeCode = json["locale_code"];
    metroCode = json["metro_code"];
    isInEuropeanUnion = json["is_in_european_union"];
  }

  String? city;
  String? region;
  String? country;
  String? continent;
  String? regionCode;
  String? countryCode;
  String? continentCode;
  String? latitude;
  String? longitude;
  String? timeZone;
  String? localeCode;
  String? metroCode;
  bool? isInEuropeanUnion;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["city"] = city;
    map["region"] = region;
    map["country"] = country;
    map["continent"] = continent;
    map["region_code"] = regionCode;
    map["country_code"] = countryCode;
    map["continent_code"] = continentCode;
    map["latitude"] = latitude;
    map["longitude"] = longitude;
    map["time_zone"] = timeZone;
    map["locale_code"] = localeCode;
    map["metro_code"] = metroCode;
    map["is_in_european_union"] = isInEuropeanUnion;
    return map;
  }
}

class Security {
  Security({
    this.vpn,
    this.proxy,
    this.tor,
    this.relay,
  });

  Security.fromJson(Map<String, dynamic> json) {
    vpn = json["vpn"];
    proxy = json["proxy"];
    tor = json["tor"];
    relay = json["relay"];
  }

  bool? vpn;
  bool? proxy;
  bool? tor;
  bool? relay;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    map["vpn"] = vpn;
    map["proxy"] = proxy;
    map["tor"] = tor;
    map["relay"] = relay;
    return map;
  }
}
