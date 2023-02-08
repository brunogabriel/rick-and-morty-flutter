import 'package:equatable/equatable.dart';

class CharacterDetailsLocationResponse extends Equatable {
  const CharacterDetailsLocationResponse({
    required this.name,
    required this.type,
    required this.dimension,
  });

  factory CharacterDetailsLocationResponse.fromJson(
          Map<String, dynamic> json) =>
      CharacterDetailsLocationResponse(
        name: json['name'],
        type: json['type'],
        dimension: json['dimension'],
      );

  final String name;
  final String type;
  final String dimension;

  @override
  List<Object> get props => [name, type, dimension];
}
