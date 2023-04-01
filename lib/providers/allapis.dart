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
    var res = await get('v3/stock/list?apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getgraphstocksdetailP(symbol, day) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/historical-chart/$day/$symbol?apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getmaterixP(symbal) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/key-metrics-ttm/$symbal?limit=40&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getstocknewsP() async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/stock_news?limit=50&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getdevidendP() async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/historical-price-full/stock_dividend/NSA?apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getsplitP() async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/historical-price-full/stock_split/NSA?apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getshareholdersdateP() async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v4/institutional-ownership/portfolio-date?cik=0001067983&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getshareholdersdatelistP(date, symbal) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v4/institutional-ownership/institutional-holders/symbol-ownership?date=$date&symbol=$symbal&page=0&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getquarterincomebalncesheetP(symbal) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/income-statement/$symbal?period=quarter&limit=400&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getannualincomebalncesheetP(symbal) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/income-statement/$symbal?limit=400&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getquarterbalncesheetP(symbal) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/balance-sheet-statement/$symbal?period=quarter&limit=50&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getannualbalncesheetP(symbal) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/balance-sheet-statement/$symbal?limit=10&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getquartercashflowP(symbal) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/cash-flow-statement/$symbal?period=quarter&limit=50&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getannualcashflowP(symbal) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/cash-flow-statement/$symbal?limit=10&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getgraphtechnicaldetailP(symbol, min) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/technical_indicator/$min/$symbol?period=10&type=ema&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getpeersP(symbol) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v4/stock_peers?symbol=$symbol&apikey=76d214939856f46dff7723ee737344bf',
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

  Future<dynamic> getcompanydetaillistP(symbol) async {
    httpClient.baseUrl = BASE_URL;

    httpClient.timeout = const Duration(seconds: 30);
    var res = await get(
        'v3/profile/$symbol?apikey=76d214939856f46dff7723ee737344bf',
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
