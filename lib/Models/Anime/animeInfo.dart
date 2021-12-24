// To parse this JSON data, do
//
//     final animeInfo = animeInfoFromJson(jsonString);

import 'dart:convert';

AnimeInfo animeInfoFromJson(String str) => AnimeInfo.fromJson(json.decode(str));

class AnimeInfo {
  AnimeInfo({
    this.requestHash,
    this.requestCached,
    this.requestCacheExpiry,
    this.malId,
    this.url,
    this.imageUrl,
    this.trailerUrl,
    this.title,
    this.titleEnglish,
    this.titleJapanese,
    this.titleSynonyms,
    this.type,
    this.source,
    this.episodes,
    this.status,
    this.airing,
    this.aired,
    this.duration,
    this.rating,
    this.score,
    this.scoredBy,
    this.rank,
    this.popularity,
    this.members,
    this.favorites,
    this.synopsis,
    this.background,
    this.premiered,
    this.broadcast,
  });

  String? requestHash;
  bool? requestCached;
  int? requestCacheExpiry;
  int? malId;
  String? url;
  String? imageUrl;
  String? trailerUrl;
  String? title;
  String? titleEnglish;
  String? titleJapanese;
  List<String>? titleSynonyms;
  String? type;
  String? source;
  dynamic episodes;
  String? status;
  bool? airing;
  Aired? aired;
  String? duration;
  String? rating;
  double? score;
  int? scoredBy;
  int? rank;
  int? popularity;
  int? members;
  int? favorites;
  String? synopsis;
  String? background;
  String? premiered;
  String? broadcast;

  factory AnimeInfo.fromJson(Map<String, dynamic> json) => AnimeInfo(
        requestHash: json["request_hash"],
        requestCached: json["request_cached"],
        requestCacheExpiry: json["request_cache_expiry"],
        malId: json["mal_id"],
        url: json["url"],
        imageUrl: json["image_url"],
        trailerUrl: json["trailer_url"],
        title: json["title"],
        titleEnglish: json["title_english"],
        titleJapanese: json["title_japanese"],
        titleSynonyms: List<String>.from(json["title_synonyms"].map((x) => x)),
        type: json["type"],
        source: json["source"],
        episodes: json["episodes"],
        status: json["status"],
        airing: json["airing"],
        aired: Aired.fromJson(json["aired"]),
        duration: json["duration"],
        rating: json["rating"],
        score: json["score"],
        scoredBy: json["scored_by"],
        rank: json["rank"],
        popularity: json["popularity"],
        members: json["members"],
        favorites: json["favorites"],
        synopsis: json["synopsis"],
        background: json["background"],
        premiered: json["premiered"],
        broadcast: json["broadcast"],
      );
}

class Aired {
  Aired({
    this.from,
    this.to,
    this.string,
  });

  DateTime? from;
  dynamic to;
  String? string;

  factory Aired.fromJson(Map<String, dynamic> json) => Aired(
        from: DateTime.parse(json["from"]),
        to: json["to"],
        string: json["string"],
      );
}
