class RadioStation {
  final String name;
  final String url;
  final String country;
  final String favicon;
  final String language;

  RadioStation({
    required this.name,
    required this.url,
    required this.country,
    required this.favicon,
    required this.language,
  });

  factory RadioStation.fromJson(Map<String, dynamic> json) {
    return RadioStation(
      name: json['name'] ?? '',
      url: json['url'] ?? '',
      country: json['country'] ?? '',
      favicon: json['favicon'] ?? '',
      language: json['language'] ?? '',
    );
  }
}
