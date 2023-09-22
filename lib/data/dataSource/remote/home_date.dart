import 'package:wahid/core/class/crud.dart';
import 'package:wahid/link_api.dart';

class HomePageData {
  Crud crud;

  HomePageData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homePage, {});
    return response.fold((l) => l, (r) => r);
  }
}
