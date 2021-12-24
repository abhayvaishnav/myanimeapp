import 'package:http/http.dart';

class Network {
  final String url;
  Network({required this.url});

  Future getData() async {
    print("calling uri: $url");
    Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(response.statusCode);
    }
  }
}

const String topAiringAnime = "https://api.jikan.moe/v3/top/anime/1/airing";
const String topUpcomingAnime = "https://api.jikan.moe/v3/top/anime/1/upcoming";
const String topAnimeMovies = "https://api.jikan.moe/v3/top/anime/1/movie";
const String animeDetail = "https://api.jikan.moe/v3/anime/";

class Anime {
  // get top airing anime
  Future<dynamic> getTopAiringAnime() async {
    Network network = Network(url: '$topAiringAnime');
    var TopAiringAnime = await network.getData();
    return TopAiringAnime;
  }

  // get top upcoming anime
  Future<dynamic> getTopUpcomingAnime() async {
    Network network = Network(url: '$topUpcomingAnime');
    var TopUpcomingAnime = await network.getData();
    return TopUpcomingAnime;
  }

  // get top anime movies
  Future<dynamic> getTopAnimeMovies() async {
    Network network = Network(url: '$topAnimeMovies');
    var TopAnimeMovies = await network.getData();
    return TopAnimeMovies;
  }

  // get anime details
  Future<dynamic> getAnimeDetails(int animeID) async {
    Network network = Network(url: '$animeDetail$animeID');
    var animeDetails = await network.getData();
    return animeDetails;
  }
}
