import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:myanimeapp/Models/Anime/animeInfo.dart';
import 'package:myanimeapp/Network/network.dart';

// ignore: must_be_immutable
class AnimePage extends StatefulWidget {
  int id;
  AnimePage({required this.id});
  @override
  _AnimePageState createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  var animeInfo = AnimeInfo();

  void getAnimeDetails() async {
    var animeDetails = await Anime().getAnimeDetails(widget.id);
    setState(() {
      animeInfo = animeInfoFromJson(animeDetails);
    });
    print(animeInfo.title);
  }

  @override
  void initState() {
    getAnimeDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        centerTitle: true,
        title: Text("${animeInfo.title}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PhysicalModel(
                color: Colors.white,
                elevation: 10,
                shadowColor: Colors.black,
                borderRadius: BorderRadius.circular(20),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(image: NetworkImage('${animeInfo.imageUrl}'))),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${animeInfo.titleEnglish}",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.yellow,
                      ),
                      SizedBox(width: 5),
                      Text("${animeInfo.favorites}",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              Text("${animeInfo.status}"),
              ExpandableText(
                "${animeInfo.synopsis}",
                expandText: 'show more',
                collapseText: 'show less',
                maxLines: 5,
                linkColor: Colors.blue,
                animation: true,
                collapseOnTextTap: true,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
