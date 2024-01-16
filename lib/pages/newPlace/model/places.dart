class Places {
  String? pImage;
  String? pName;
  num? pRate;
  num? doorsRate;
  num? servicesRate;
  num? wcRate;

  Places({
    this.pImage,
    this.pName,
    this.pRate,
    this.doorsRate,
    this.servicesRate,
    this.wcRate,
  });
  Places.fromJson(Map json) {
    pImage = json['p_image'];
    pName = json['p_name'];
    pRate = json['pRate'];
    doorsRate = json['doorsRate'];
    servicesRate = json['servicesRate'];
    wcRate = json['wcRate'];
  }
  Map toJson() {
    final Map data = {};
    data['p_image'] = pImage;
    data['p_name'] = pName;
    data['pRate'] = pRate;
    data['doorsRate'] = doorsRate;
    data['servicesRate'] = servicesRate;
    data['wcRate'] = wcRate;

    return data;
  }
}
