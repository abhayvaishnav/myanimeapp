import 'dart:convert';

TopAnime topAnimeFromJson(String str) => TopAnime.fromJson(json.decode(str));

class TopAnime {
  TopAnime({
    this.requestHash,
    this.requestCached,
    this.requestCacheExpiry,
    this.topAnimeList,
  });

  String? requestHash;
  bool? requestCached;
  int? requestCacheExpiry;
  List<TopAnimeList>? topAnimeList;

  factory TopAnime.fromJson(Map<String, dynamic> json) => TopAnime(
        requestHash: json["request_hash"],
        requestCached: json["request_cached"],
        requestCacheExpiry: json["request_cache_expiry"],
        topAnimeList: List<TopAnimeList>.from(
            json["top"].map((x) => TopAnimeList.fromJson(x))),
      );
}

class TopAnimeList {
  TopAnimeList({
    this.malId,
    this.rank,
    this.title,
    this.url,
    this.imageUrl,
    this.type,
    this.episodes,
    this.startDate,
    this.endDate,
    this.members,
    this.score,
  });

  int? malId;
  int? rank;
  String? title;
  String? url;
  String? imageUrl;
  String? type;
  int? episodes;
  String? startDate;
  String? endDate;
  int? members;
  double? score;

  factory TopAnimeList.fromJson(Map<String, dynamic> json) => TopAnimeList(
        malId: json["mal_id"],
        rank: json["rank"],
        title: json["title"],
        url: json["url"],
        imageUrl: json["image_url"],
        type: json["type"],
        episodes: json["episodes"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        members: json["members"],
        score: json["score"].toDouble(),
      );
}
