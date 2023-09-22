import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/cours_controller.dart';
import 'package:wahid/core/constant/name_routes.dart';
import 'package:wahid/data/model/category.dart';
import 'package:wahid/data/model/coursModel.dart';

// ignore: must_be_immutable
class CoursScreen extends StatelessWidget {
  CategoryModel? categoryModel;
  CoursScreen({Key? key, this.categoryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CoursControllerImp());
    int i = 0;
    return GetBuilder<CoursControllerImp>(
        builder: (controller) => FutureBuilder<List<CoursModel>>(
              future: controller.fetchYoutubePlaylist(controller.categories[i][
                  'playList']), //fetchYoutubePlaylist(), categories[index]['categories_name']
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                List<CoursModel> videos = snapshot.data ?? [];

                return Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.offAllNamed(AppNameRoute.home);
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                    ),
                    title: Text(" ${categoryModel!.image!}دروس خاص بـ"),
                    toolbarHeight: 50.0,
                    centerTitle: true,
                  ),
                  body: ListView.builder(
                    itemCount: videos.length,
                    itemBuilder: (context, index) {
                      var video = videos[index];
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 120.0,
                          child: ListTile(
                            leading: Image.network(video.thumbnailUrl),
                            title: Text(video.title),
                            onTap: () {
                              controller.launchVideo(context, video.id);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ));
  }
}
