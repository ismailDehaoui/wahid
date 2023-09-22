import 'package:wahid/core/class/crud.dart';
import 'package:wahid/link_api.dart';

class InformationData {
  Crud crud;

  InformationData(this.crud);

  getData(String email) async {
    var response = await crud.postData(AppLink.profil, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
