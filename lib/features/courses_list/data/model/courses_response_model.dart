import 'package:perfection_structure/core/base_network/base_model.dart';

class CoursesResponseModel extends BaseModel {
  CoursesResponseModel({
     this.data,
     this.source,
  });

  final List<CoursesResponseModelDatum>? data;
  final List<Source>? source;

  // factory CoursesResponseModel.fromJson(Map<String, dynamic> json){
  //   return CoursesResponseModel(
  //     data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  //     source: json["source"] == null ? [] : List<Source>.from(json["source"]!.map((x) => Source.fromJson(x))),
  //   );
  // }

  Map<String, dynamic> toJson() => {
    "data": data!.map((x) => x?.toJson()).toList(),
    "source": source!.map((x) => x?.toJson()).toList(),
  };

  @override
  List<Object?> get props => [];

    @override
    CoursesResponseModel fromJson(Map<String, dynamic> json) =>
        CoursesResponseModel(
          data: json["data"] == null ? [] : List<CoursesResponseModelDatum>.from(json["data"]!.map((x) => CoursesResponseModelDatum.fromJson(x))),
          source: json["source"] == null ? [] : List<Source>.from(json["source"]!.map((x) => Source.fromJson(x))),
        );
    factory CoursesResponseModel.fromJson(Map<String, dynamic> json) {
      return CoursesResponseModel(
        data: json["data"] == null ? [] : List<CoursesResponseModelDatum>.from(json["data"]!.map((x) => CoursesResponseModelDatum.fromJson(x))),
        source: json["source"] == null ? [] : List<Source>.from(json["source"]!.map((x) => Source.fromJson(x))),
      );
    }
}

class CoursesResponseModelDatum extends BaseModel {
  CoursesResponseModelDatum({
    required this.idNation,
    required this.nation,
    required this.idYear,
    required this.year,
    required this.population,
    required this.slugNation,
  });

  final String? idNation;
  final String? nation;
  final int? idYear;
  final String? year;
  final int? population;
  final String? slugNation;

  // factory Datum.fromJson(Map<String, dynamic> json){
  //   return Datum(
  //     idNation: json["ID Nation"],
  //     nation: json["Nation"],
  //     idYear: json["ID Year"],
  //     year: json["Year"],
  //     population: json["Population"],
  //     slugNation: json["Slug Nation"],
  //   );
  // }

  @override
  CoursesResponseModelDatum fromJson(Map<String, dynamic> json) =>
      CoursesResponseModelDatum(
        idNation: json["ID Nation"],
        nation: json["Nation"],
        idYear: json["ID Year"],
        year: json["Year"],
        population: json["Population"],
        slugNation: json["Slug Nation"],
      );
  factory CoursesResponseModelDatum.fromJson(Map<String, dynamic> json) {
    return CoursesResponseModelDatum(
      idNation: json["ID Nation"],
      nation: json["Nation"],
      idYear: json["ID Year"],
      year: json["Year"],
      population: json["Population"],
      slugNation: json["Slug Nation"],
    );
  }

  Map<String, dynamic> toJson() => {
    "ID Nation": idNation,
    "Nation": nation,
    "ID Year": idYear,
    "Year": year,
    "Population": population,
    "Slug Nation": slugNation,
  };

  @override
  List<Object?> get props => [
    idNation, nation, idYear, year, population, slugNation, ];
}

class Source extends BaseModel {
  Source({
    required this.measures,
    // required this.annotations,
    required this.name,
    required this.substitutions,
  });

  final List<String> measures;
  // final Annotations? annotations;
  final String? name;
  final List<dynamic> substitutions;

  // factory Source.fromJson(Map<String, dynamic> json){
  //   return Source(
  //     measures: json["measures"] == null ? [] : List<String>.from(json["measures"]!.map((x) => x)),
  //     annotations: json["annotations"] == null ? null : Annotations.fromJson(json["annotations"]),
  //     name: json["name"],
  //     substitutions: json["substitutions"] == null ? [] : List<dynamic>.from(json["substitutions"]!.map((x) => x)),
  //   );
  // }

  @override
  Source fromJson(Map<String, dynamic> json) =>
      Source(
        measures: json["measures"] == null ? [] : List<String>.from(json["measures"]!.map((x) => x)),
        // annotations: json["annotations"] == null ? null : Annotations.fromJson(json["annotations"]),
        name: json["name"],
        substitutions: json["substitutions"] == null ? [] : List<dynamic>.from(json["substitutions"]!.map((x) => x)),
      );
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      measures: json["measures"] == null ? [] : List<String>.from(json["measures"]!.map((x) => x)),
      // annotations: json["annotations"] == null ? null : Annotations.fromJson(json["annotations"]),
      name: json["name"],
      substitutions: json["substitutions"] == null ? [] : List<dynamic>.from(json["substitutions"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
    "measures": measures.map((x) => x).toList(),
    // "annotations": annotations?.toJson(),
    "name": name,
    "substitutions": substitutions.map((x) => x).toList(),
  };

  @override
  List<Object?> get props => [
    measures, name, substitutions, ];
}

// class Annotations extends Equatable {
//   Annotations({
//     required this.sourceName,
//     required this.sourceDescription,
//     required this.datasetName,
//     required this.datasetLink,
//     required this.tableId,
//     required this.topic,
//     required this.subtopic,
//   });
//
//   final String? sourceName;
//   final String? sourceDescription;
//   final String? datasetName;
//   final String? datasetLink;
//   final String? tableId;
//   final String? topic;
//   final String? subtopic;
//
//   factory Annotations.fromJson(Map<String, dynamic> json){
//     return Annotations(
//       sourceName: json["source_name"],
//       sourceDescription: json["source_description"],
//       datasetName: json["dataset_name"],
//       datasetLink: json["dataset_link"],
//       tableId: json["table_id"],
//       topic: json["topic"],
//       subtopic: json["subtopic"],
//     );
//   }
//
//   Map<String, dynamic> toJson() => {
//     "source_name": sourceName,
//     "source_description": sourceDescription,
//     "dataset_name": datasetName,
//     "dataset_link": datasetLink,
//     "table_id": tableId,
//     "topic": topic,
//     "subtopic": subtopic,
//   };
//
//   @override
//   List<Object?> get props => [
//     sourceName, sourceDescription, datasetName, datasetLink, tableId, topic, subtopic, ];
// }


