import 'package:equatable/equatable.dart';

class CharacterInfoResponse extends Equatable {
  const CharacterInfoResponse(
    this.count,
    this.pages,
    this.next,
    this.prev,
  );

  factory CharacterInfoResponse.fromJson(Map<String, dynamic> json) =>
      CharacterInfoResponse(
        json['count'] as int?,
        json['pages'] as int?,
        json['next'] as String?,
        json['prev'] as String?,
      );
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  @override
  List<Object?> get props => [count, pages, next, prev];
}

class CharacterResponse extends Equatable {
  const CharacterResponse(
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.image,
  );

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      CharacterResponse(
        json['id'] as int,
        json['name'] as String,
        json['status'] as String,
        json['species'] as String,
        json['type'] as String,
        json['image'] as String,
      );
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String image;

  @override
  List<Object> get props => [
        id,
        name,
        status,
        species,
        type,
        image,
      ];
}

class CharacterApiResponse extends Equatable {
  const CharacterApiResponse(this.info, this.results);

  factory CharacterApiResponse.fromJson(Map<String, dynamic> json) =>
      CharacterApiResponse(
        CharacterInfoResponse.fromJson(json['info']),
        (json['results'] as List<dynamic>)
            .map((characterJson) => CharacterResponse.fromJson(characterJson))
            .toList(),
      );
  final CharacterInfoResponse info;
  final List<CharacterResponse> results;

  @override
  List<Object> get props => [info, results];
}
