class GetAllCategoriesModel {
  String? slug;
  String? name;
  String? url;

  GetAllCategoriesModel({this.slug, this.name, this.url});

  GetAllCategoriesModel.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['name'] = name;
    data['url'] = url;
    return data;
  }

  //toMap
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slug': slug,
      'name': name,
      'url': url,
    };
  }

  //fromMap
  factory GetAllCategoriesModel.fromMap(Map<String, dynamic> map) {
    return GetAllCategoriesModel(
      slug: map['slug'] as String,
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  //copyWith
  GetAllCategoriesModel copyWith({
    String? slug,
    String? name,
    String? url,
  }) {
    return GetAllCategoriesModel(
      slug: slug ?? this.slug,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  @override
  String toString() => 'GetAllCategories(slug: $slug, name: $name, url: $url)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetAllCategoriesModel &&
        other.slug == slug &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode => slug.hashCode ^ name.hashCode ^ url.hashCode;

  
}
