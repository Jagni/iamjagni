import 'package:json_annotation/json_annotation.dart';
part 'url.g.dart';

@JsonSerializable()
class ProjectURL with Comparable {
  final String label;
  final String url;

  ProjectURL(this.label, this.url);

  @override
  int compareTo(other) {
    if (other is ProjectURL) return label.compareTo(other.label);
    return 0;
  }

  factory ProjectURL.fromJson(Map<String, dynamic> json) =>
      _$ProjectURLFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectURLToJson(this);
}
