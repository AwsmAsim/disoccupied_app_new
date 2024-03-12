import 'Company.dart';

class Brand {
  final String name;
  final String? alias;
  final String? searchAlias;
  final String desc;
  final String descOption;
  final String logo;
  final String? proof;
  final String? url;
  final Company company;
  final bool logoStatus;
  final String brandCondition;
  final String? brandImage;
  final List<dynamic> categories;

  Brand({
    required this.name,
    this.alias,
    this.searchAlias,
    required this.desc,
    required this.descOption,
    required this.logo,
    this.proof,
    this.url,
    required this.company,
    required this.logoStatus,
    required this.brandCondition,
    this.brandImage,
    required this.categories,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    name: json['brand']['name'],
    alias: json['brand']['alias'],
    searchAlias: json['brand']['search_alias'],
    desc: json['brand']['desc'],
    descOption: json['brand']['desc_option'],
    logo: json['brand']['logo'],
    proof: json['brand']['proof'],
    url: json['brand']['url'],
    company: Company.fromJson(json['brand']),
    logoStatus: json['brand']['logo_status'],
    brandCondition: json['brand']['brand_condition'],
    brandImage: json['brand_img'],
    categories: json['brand_categories']
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    if (alias != null) 'alias': alias,
    if (searchAlias != null) 'search_alias': searchAlias,
    'desc': desc,
    'desc_option': descOption,
    'logo': logo,
    if (proof != null) 'proof': proof,
    if (url != null) 'url': url,
    'company': company.toJson(),
    'logo_status': logoStatus,
    'brand_condition': brandCondition,
    'brand_img': brandImage,
    'brand_categories': categories,
  };
}