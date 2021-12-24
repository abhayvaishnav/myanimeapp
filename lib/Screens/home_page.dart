// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:myanimeapp/Models/Anime/top_anime.dart';
import 'package:myanimeapp/Network/network.dart';
import 'package:myanimeapp/Screens/anime_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //airing anime list
  TopAnime topAiringAnime = TopAnime();
  TopAnime topUpcomingAnime = TopAnime();
  TopAnime topAnimeMovies = TopAnime();

  // api call function
  void getAnimeData() async {
    var airingAnime = await Anime().getTopAiringAnime();
    var upcomingAnime = await Anime().getTopUpcomingAnime();
    var animeMovies = await Anime().getTopAnimeMovies();
    setState(() {
      topAiringAnime = topAnimeFromJson(airingAnime);
      topUpcomingAnime = topAnimeFromJson(upcomingAnime);
      topAnimeMovies = topAnimeFromJson(animeMovies);
    });
  }

  @override
  void initState() {
    getAnimeData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimeFlex"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Airing Anime',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: topAiringAnime.topAnimeList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnimePage(
                                      id: topAiringAnime
                                          .topAnimeList![index].malId!,
                                    )),
                          );
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${topAiringAnime.topAnimeList![index].imageUrl}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(
                            '${topAiringAnime.topAnimeList![index].title}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Upcoming Anime',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: topUpcomingAnime.topAnimeList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AnimePage(
                                      id: topUpcomingAnime
                                          .topAnimeList![index].malId!,
                                    )),
                          );
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                          height: MediaQuery.of(context).size.height * 0.23,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${topUpcomingAnime.topAnimeList![index].imageUrl}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text(
                            '${topUpcomingAnime.topAnimeList![index].title}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Top Anime Movies',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: topAnimeMovies.topAnimeList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        height: MediaQuery.of(context).size.height * 0.23,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                '${topAnimeMovies.topAnimeList![index].imageUrl}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Text(
                          '${topAnimeMovies.topAnimeList![index].title}',
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



// Column(
//               children: topAiringAnime.topAiringAnimeList!
//                   .map(
//                     (topAiringAnimeList) => Container(
//                       height: MediaQuery.of(context).size.height * 0.3,
//                       width: MediaQuery.of(context).size.width * 0.4,
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black),
//                         image: DecorationImage(
//                           image: NetworkImage('${topAiringAnimeList.imageUrl}'),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Text(
//                         '${topAiringAnimeList.title}',
//                       ),
//                     ),
//                   )
//                   .toList(),
//             ),