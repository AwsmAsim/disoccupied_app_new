
class Company {
  final int companyId;
  final String companyName;
  final String companyLevel;
  final String companyWhy;
  final String companyProof;
  final String? companyUrl;

  Company({
    required this.companyId,
    required this.companyName,
    required this.companyLevel,
    required this.companyWhy,
    required this.companyProof,
    this.companyUrl,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    companyId: json['company']['company_idd'],
    companyName: json['company']['company_name'],
    companyLevel: json['company']['company_level'],
    companyWhy: json['company']['company_why'],
    companyProof: json['company']['company_proof'],
    companyUrl: json['company'].containsKey('company_url')
        ? json['company']['company_url']
        : null,
  );

  Map<String, dynamic> toJson() => {
    'company_id': companyId,
    'company_name': companyName,
    'company_level': companyLevel,
    'company_why': companyWhy,
    'company_proof': companyProof,
    if (companyUrl != null) 'company_url': companyUrl,
  };
}