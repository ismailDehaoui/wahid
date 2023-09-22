import 'dart:convert';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wahid/core/functions/handiling_data.dart';
import 'package:wahid/data/dataSource/apiKey/keays.dart';
import 'package:wahid/data/dataSource/remote/home_date.dart';
import 'package:wahid/data/model/category.dart';
import 'package:wahid/data/model/coursModel.dart';
import 'package:http/http.dart' as http;

import '../core/class/status_request.dart';

abstract class CoursController extends GetxController {
  initiaData();
  fetchYoutubePlaylist(String playlistId);
  launchVideo(context, String videoId);
  getData();
}

class CoursControllerImp extends CoursController {
  List<CoursModel> cours = [];
  List<CoursModel> fetchdCours = [];
  HomePageData homePageData = HomePageData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List categories = [];
  CategoryModel? cat;
  @override
  initiaData() {
    cours = fetchdCours;
    print("cours : ${cours}");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homePageData.getData();
    //print("=================== Controller $response ");
    print("=========");
    cat!.toJson();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        categories.addAll(response['categories']);
        // if (response['categories']['categories_name '] == "الألوان")
        //   print("1");
        // else
        //   print(0);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  Future<List<CoursModel>> fetchYoutubePlaylist(String playlistId) async {
    String apiKey = API_KEY;
    String apiUrl = 'https://www.googleapis.com/youtube/v3/playlistItems'
        '?part=snippet'
        '&maxResults=10'
        '&playlistId=$playlistId'
        '&key=$apiKey';
    var response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      var items = data['items'];
      List<CoursModel> fetchedVideos = [];
      for (var item in items) {
        var snippet = item['snippet'];
        var videoId = snippet['resourceId']['videoId'];
        var title = snippet['title'];
        var thumbnailUrl = snippet['thumbnails']['default']['url'];
        fetchedVideos.add(
            CoursModel(id: videoId, title: title, thumbnailUrl: thumbnailUrl));
      }
      return fetchedVideos;
    } else {
      print('Failed to fetch YouTube playlist: ${response.statusCode}');
      return [];
    }
  }

  @override
  void onInit() {
    initiaData();
    super.onInit();
  }

  @override
  void launchVideo(context, String videoId) async {
    String url = 'https://www.youtube.com/watch?v=$videoId';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}

/*
import 'dart:convert';

import 'package:wahid/data/dataSource/apiKey/keays.dart';
import 'package:wahid/data/model/coursModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class CoursController {
  List<CoursModel> videos = [];

  Future<List<CoursModel>> fetchYoutubePlaylist() async {
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

      List<CoursModel> fetchedVideos = [];

      for (var item in items) {
        var snippet = item['snippet'];
        var videoId = snippet['resourceId']['videoId'];
        var title = snippet['title'];
        var thumbnailUrl = snippet['thumbnails']['default']['url'];

        fetchedVideos.add(
            CoursModel(id: videoId, title: title, thumbnailUrl: thumbnailUrl));
      }

      return fetchedVideos;
    } else {
        print('Failed to fetch YouTube playlist: ${response.statusCode}');
        return [];
    }
  }

  void launchVideo(context, String videoId) async {
    String url = 'https://www.youtube.com/watch?v=$videoId';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
*/