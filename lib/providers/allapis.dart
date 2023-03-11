import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../baseurl.dart';

class ApisProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> getsearchstocksP(name) async {
    httpClient.baseUrl = BASE_URL;
    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/search?query=$name&limit=10&exchange=NSE&apikey=76d214939856f46dff7723ee737344bf',
        headers: {
          "Accept": "application/json",
        });
    if (res.statusCode == 200 || res.statusCode == 201) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      // print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  Future<dynamic> getstockslistP() async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/stock/list?apikey=76d214939856f46dff7723ee737344bf',
        headers: {
          "Accept": "application/json",
        });
    if (res.statusCode == 200 || res.statusCode == 201) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      // print(res.statusText);
      return Future.error('Network Problem');
    }
  }

  Future<dynamic> getstocksdetaillistP(symbol) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v4/company-outlook?symbol=$symbol&apikey=76d214939856f46dff7723ee737344bf',
        headers: {
          "Accept": "application/json",
        });
    if (res.statusCode == 200 || res.statusCode == 201) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else {
      // print(res.statusText);
      return Future.error('Network Problem');
    }
  }
}
