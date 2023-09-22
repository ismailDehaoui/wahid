import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wahid/data/dataSource/apiKey/keays.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:wahid/data/model/coursModel.dart';

class CoursS extends StatefulWidget {
  const CoursS({super.key});

  @override
  State<CoursS> createState() => _CoursSState();
}

class _CoursSState extends State<CoursS> {
  List<CoursModel> videos = [];

  @override
  void initState() {
    super.initState();
    fetchYoutubePlaylist();
  }

  Future<void> fetchYoutubePlaylist() async {
    // My Youtube Date API Key
    String apiKey = API_KEY;

    // My Youtube Playlist ID
    String playlistId = 'PLtCLV_dVwtAeK7e_SSiHAk4Hw8FkDzmoU';

    // Youtube Data API Endpoint To Retrieve Playlist Items
    String apiUrl = 'https://www.googleapis.com/youtube/v3/playlistItems'
        '?part=snippet'
        '&maxResults=10'
        '&playlistId=$playlistId'
        '&key=$apiKey';

    // Fetch playlist items
    var response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var items = data['items'];

      List<CoursModel> fetchdVideos = [];

      for (var item in items) {
        var snippet = item['snippet'];
        var videoId = snippet['resourceId']['videoId'];
        var title = snippet['title'];
        var thumbnailUrl = snippet['thumbnails']['default']['url'];

        fetchdVideos.add(
            CoursModel(id: videoId, title: title, thumbnailUrl: thumbnailUrl));
      }
      setState(() {
        videos = fetchdVideos;
      });
      print("video = ${videos.length}");
    } else {
      print('Failed to fetch YouTube playlist: ${response.statusCode}');
    }
  }

  void launchVideo(String videoId) async {
    String url = 'https://www.youtube.com/watch?v=$videoId';
    print("video = ${videos.length}");
    if (await canLaunch(url)) {
      await launch(url);
      print("video = ${videos.length}");
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (context) => HomeScreen()));
          },
        ),
        title: Text(" قناتي في اليوتيوب"),
        toolbarHeight: 50.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          /*
          if (index == 0)
            return _buildProfileInfo();
          else {
            var video = videos[index];
            return _buildVideo(video);
          } */
          var video = videos[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 120.0,
              child: ListTile(
                leading: Image.network(video.thumbnailUrl),
                title: Text(video.title),
                onTap: () {
                  launchVideo(video.id);
                },
              ),
            ),
          );
        },
      ),
    );
  }

  // ignore: unused_element
  _buildProfileInfo() {
    return Container(
      margin: EdgeInsets.all(20.0),
      padding: EdgeInsets.all(8.0),
      height: 100.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
        )
      ]),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            backgroundImage: AssetImage("assets/images/ABC/abcd.png"),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "قناة وحيد",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "اشترك في القناة",
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
              )
            ],
          )),
        ],
      ),
    );
  }

  // ignore: unused_element
  _buildVideo(CoursModel video) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      padding: EdgeInsets.all(10.0),
      height: 140.0,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6.0,
        )
      ]),
      child: Column(
        children: <Widget>[
          Image(
            width: 50,
            image: NetworkImage(video.thumbnailUrl),
          ),
          SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Text(
              video.title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
