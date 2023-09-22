import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahid/controller/cours_controller.dart';
import 'package:wahid/controller/home_page_controller.dart';
import 'package:wahid/core/constant/name_routes.dart';
//import 'package:wahid/controller/cours_controller.dart';
import 'package:wahid/data/model/coursModel.dart';
//  msahtah  wa9ila 
class AlphabitScreen extends StatelessWidget {
  const AlphabitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CoursControllerImp());
    Get.put(HomeControllerImp());
    return GetBuilder<CoursControllerImp>(
        builder: (controller) => FutureBuilder<List<CoursModel>>(
              future: controller.fetchYoutubePlaylist(
                  'PLtCLV_dVwtAcI1vijcytYR-i-NK7_16zQ'), //fetchYoutubePlaylist(),
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
                        Get.toNamed(AppNameRoute.home);
                      },
                    ),
                    title: Text(" قناتي في اليوتيوب"),
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
