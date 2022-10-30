class SearchModel {
  SearchModel({
    required this.total,
    required this.totalHits,
    required this.hits,
  });
  late final int total;
  late final int totalHits;
  late final List<Hits> hits;
  
  SearchModel.fromJson(Map<String, dynamic> json){
    total = json['total'];
    totalHits = json['totalHits'];
    hits = List.from(json['hits']).map((e)=>Hits.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['totalHits'] = totalHits;
    _data['hits'] = hits.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Hits {
  Hits({
    required this.id,
    required this.user,
    required this.userImageURL,
  });
  late final int id;
  late final String user;
  late final String userImageURL;
  
  Hits.fromJson(Map<String, dynamic> json){
    id = json['id'];
    user = json['user'];
    userImageURL = json['previewURL'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user'] = user;
    _data['previewURL'] = userImageURL;
    return _data;
  }
}