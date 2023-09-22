import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:wahid/core/class/status_request.dart';
import 'package:wahid/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  /*
    * C => Create;
    * R => Read;
    * U => Update;
    * D => Delete;
  */
/*
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode);
      print("ee: ${response.body}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          Map responsebody = json.decode(response.body);
          print(responsebody);
          return Right(responsebody);
        } catch (e) {
          print("Error decoding JSON: $e");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }
 */
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    if (await checkInternet()) {}
    var response = await http.post(Uri.parse(linkurl), body: data);
    print(response.statusCode);
    print("ee: ${response.body}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map responsebody = jsonDecode(response.body);
      //print(responsebody);
      return Right(responsebody);
    } else {
      return const Left(StatusRequest.serverFailure);
    }
    // } else {
    //   return const Left(StatusRequest.loading);
    // }
  }

  /*
  Future<Either<StatusRequest, Map>> postData(String linkUrk, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkUrk), body: data);
      print("zz: ${response.statusCode}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        print("aloo");
        print(responsebody);
        return Right(responsebody);
      } else {
        print("left sf");
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }
  */
}
