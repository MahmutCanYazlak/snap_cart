class GetAllProducts {
  String? slug;
  String? name;
  String? url;

  GetAllProducts({this.slug, this.name, this.url});

  GetAllProducts.fromJson(Map<String, dynamic> json) {
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
    return {
      'slug': slug,
      'name': name,
      'url': url,
    };
  }

  //fromMap
  factory GetAllProducts.fromMap(Map<String, dynamic> map) {
    return GetAllProducts(
      slug: map['slug'],
      name: map['name'],
      url: map['url'],
    );
  }

  @override
  String toString() {
    return 'GetAllProducts{slug: $slug, name: $name, url: $url}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetAllProducts &&
        other.slug == slug &&
        other.name == name &&
        other.url == url;
  }

  @override
  int get hashCode => slug.hashCode ^ name.hashCode ^ url.hashCode;

  GetAllProducts copyWith({
    String? slug,
    String? name,
    String? url,
  }) {
    return GetAllProducts(
      slug: slug ?? this.slug,
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }
}
