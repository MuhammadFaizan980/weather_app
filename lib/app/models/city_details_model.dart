class CityDetailsModel {
  String? name;
  LocalNames? localNames;
  double? lat;
  double? lon;
  String? country;
  String? state;

  CityDetailsModel({
    name,
    localNames,
    lat,
    lon,
    country,
    state,
  });

  CityDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    localNames = json['local_names'] != null ? LocalNames.fromJson(json['local_names']) : null;
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    if (localNames != null) {
      data['local_names'] = localNames!.toJson();
    }
    data['lat'] = lat;
    data['lon'] = lon;
    data['country'] = country;
    data['state'] = state;
    return data;
  }
}

class LocalNames {
  String? ks;
  String? ps;
  String? tr;
  String? de;
  String? ug;
  String? fr;
  String? cs;
  String? et;
  String? ko;
  String? pa;
  String? nl;
  String? ru;
  String? fa;
  String? es;
  String? zh;
  String? ml;
  String? sv;
  String? pl;
  String? en;
  String? ta;
  String? he;
  String? hi;
  String? pt;
  String? ur;
  String? oc;
  String? sd;
  String? no;
  String? ar;
  String? ku;
  String? kn;
  String? it;
  String? eo;

  LocalNames({ks, ps, tr, de, ug, fr, cs, et, ko, pa, nl, ru, fa, es, zh, ml, sv, pl, en, ta, he, hi, pt, ur, oc, sd, no, ar, ku, kn, it, eo});

  LocalNames.fromJson(Map<String, dynamic> json) {
    ks = json['ks'];
    ps = json['ps'];
    tr = json['tr'];
    de = json['de'];
    ug = json['ug'];
    fr = json['fr'];
    cs = json['cs'];
    et = json['et'];
    ko = json['ko'];
    pa = json['pa'];
    nl = json['nl'];
    ru = json['ru'];
    fa = json['fa'];
    es = json['es'];
    zh = json['zh'];
    ml = json['ml'];
    sv = json['sv'];
    pl = json['pl'];
    en = json['en'];
    ta = json['ta'];
    he = json['he'];
    hi = json['hi'];
    pt = json['pt'];
    ur = json['ur'];
    oc = json['oc'];
    sd = json['sd'];
    no = json['no'];
    ar = json['ar'];
    ku = json['ku'];
    kn = json['kn'];
    it = json['it'];
    eo = json['eo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['ks'] = ks;
    data['ps'] = ps;
    data['tr'] = tr;
    data['de'] = de;
    data['ug'] = ug;
    data['fr'] = fr;
    data['cs'] = cs;
    data['et'] = et;
    data['ko'] = ko;
    data['pa'] = pa;
    data['nl'] = nl;
    data['ru'] = ru;
    data['fa'] = fa;
    data['es'] = es;
    data['zh'] = zh;
    data['ml'] = ml;
    data['sv'] = sv;
    data['pl'] = pl;
    data['en'] = en;
    data['ta'] = ta;
    data['he'] = he;
    data['hi'] = hi;
    data['pt'] = pt;
    data['ur'] = ur;
    data['oc'] = oc;
    data['sd'] = sd;
    data['no'] = no;
    data['ar'] = ar;
    data['ku'] = ku;
    data['kn'] = kn;
    data['it'] = it;
    data['eo'] = eo;
    return data;
  }
}
