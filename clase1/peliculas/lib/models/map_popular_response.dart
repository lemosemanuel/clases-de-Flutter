// To parse this JSON data, do
//
//     final popularMapingResponse = popularMapingResponseFromMap(jsonString);

import 'dart:convert';

import 'package:peliculas/models/map_now_playing_response.dart';


class PopularMapingResponse {
    PopularMapingResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    factory PopularMapingResponse.fromJson(String str) => PopularMapingResponse.fromMap(json.decode(str));

    // String toJson() => json.encode(toMap());

    factory PopularMapingResponse.fromMap(Map<String, dynamic> json) => PopularMapingResponse(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    // Map<String, dynamic> toMap() => {
    //     "page": page,
    //     "results": List<dynamic>.from(results.map((x) => x.toMap())),
    //     "total_pages": totalPages,
    //     "total_results": totalResults,
    // };
}

// class Result {
//     Result({
//         required this.adult,
//         required this.backdropPath,
//         required this.genreIds,
//         required this.id,
//         required this.originalLanguage,
//         required this.originalTitle,
//         required this.overview,
//         required this.popularity,
//         required this.posterPath,
//         required this.releaseDate,
//         required this.title,
//         required this.video,
//         required this.voteAverage,
//         required this.voteCount,
//     });

//     bool adult;
//     String backdropPath;
//     List<int> genreIds;
//     int id;
//     String originalLanguage;
//     String originalTitle;
//     String overview;
//     double popularity;
//     String posterPath;
//     String releaseDate;
//     String title;
//     bool video;
//     double voteAverage;
//     int voteCount;

//     factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

//     // String toJson() => json.encode(toMap());

//     factory Result.fromMap(Map<String, dynamic> json) => Result(
//         adult: json["adult"],
//         backdropPath: json["backdrop_path"],
//         genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//         id: json["id"],
//         originalLanguage:json["original_language"],
//         originalTitle: json["original_title"],
//         overview: json["overview"],
//         popularity: json["popularity"].toDouble(),
//         posterPath: json["poster_path"],
//         releaseDate: json["release_date"],
//         title: json["title"],
//         video: json["video"],
//         voteAverage: json["vote_average"].toDouble(),
//         voteCount: json["vote_count"],
//     );

//     // Map<String, dynamic> toMap() => {
//     //     "adult": adult,
//     //     "backdrop_path": backdropPath,
//     //     "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
//     //     "id": id,
//     //     "original_language": originalLanguageValues.reverse[originalLanguage],
//     //     "original_title": originalTitle,
//     //     "overview": overview,
//     //     "popularity": popularity,
//     //     "poster_path": posterPath,
//     //     "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
//     //     "title": title,
//     //     "video": video,
//     //     "vote_average": voteAverage,
//     //     "vote_count": voteCount,
//     // };
// }

// enum OriginalLanguage { EN, ES, FR, JA }

// // final originalLanguageValues = EnumValues({
// //     "en": OriginalLanguage.EN,
// //     "es": OriginalLanguage.ES,
// //     "fr": OriginalLanguage.FR,
// //     "ja": OriginalLanguage.JA
// // });

// // class EnumValues<T> {
// //     Map<String, T> map;
// //     Map<T, String> reverseMap;

// //     EnumValues(this.map);

// //     Map<T, String> get reverse {
// //         if (reverseMap == null) {
// //             reverseMap = map.map((k, v) => new MapEntry(v, k));
// //         }
// //         return reverseMap;
// //     }
// // }
