import 'package:wahid/core/class/crud.dart';
import 'package:wahid/link_api.dart';

class SignUpData {
  Crud crud;

  SignUpData(this.crud);

  postdata(String firstName, String lastName, String email, String password,
      String phone) async {
    var response = await crud.postData(AppLink.signup, {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
