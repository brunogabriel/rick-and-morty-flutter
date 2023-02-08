import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/details/data/service/character_details_location_response.dart';

class CharacterDetailsResponse extends Equatable {
  const CharacterDetailsResponse({
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.image,
    required this.gender,
    required this.locations,
  });

  factory CharacterDetailsResponse.fromJson(Map<String, dynamic> json) =>
      CharacterDetailsResponse(
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        image: json['image'],
        gender: json['gender'],
        locations: (json['locations'] as List<dynamic>)
            .map((e) => CharacterDetailsLocationResponse.fromJson(e))
            .toList(),
      );

  final String name;
  final String status;
  final String species;
  final String type;
  final String image;
  final String gender;
  final List<CharacterDetailsLocationResponse> locations;

  @override
  List<Object> get props => [
        name,
        status,
        species,
        type,
        image,
        gender,
        locations,
      ];
}
