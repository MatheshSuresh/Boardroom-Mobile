import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hot_desking/core/app_helpers.dart';
import 'package:hot_desking/core/app_urls.dart';
import 'package:hot_desking/core/widgets/show_snackbar.dart';
import 'package:http/http.dart' as http;

class BookedDataSource {
  static Future<Map> getBookingHistory() async {
  
    Map mp = {};
    var client = http.Client();
    print(Uri.parse(AppUrl.viewByEmployee));
    try {
      var response = await client.post(Uri.parse(AppUrl.viewByEmployee),
          //      headers: {
          //   HttpHeaders.contentTypeHeader: 'application/json'
          // },
          body: {
            "employeeid":
                AppHelpers.SHARED_PREFERENCES.getInt('user_id') != null
                    ? AppHelpers.SHARED_PREFERENCES.getInt('user_id').toString()
                    : 1,
          });
      print(response);
      if (response.statusCode == 200) {
        mp['flag'] = true;
        mp['data'] = jsonDecode(response.body);
        return mp;
        // var jsonString = response.body;
      } else {
        print(response.statusCode);
        // LoginFailureResponse res = loginFailureResponseFromJson(response.body);
        /* showSnackBar(
            context: Get.context!,
            message: 'Error loading data',
            bgColor: Colors.red);*/
        return {'flag': false};

        //return false;
      }
    } catch (e) {
      // showSnackBar(
      //     context: Get.context!, message: e.toString(), bgColor: Colors.red);
      // print(e);
      return {'flag': false};
    }
  }

  static Future<Map> getCurrentHistory(String date, String time) async {
    var client = http.Client();
    try {
      var response = await client.post(Uri.parse(AppUrl.viewByTime),
          //      headers: {
          //   HttpHeaders.contentTypeHeader: 'application/json'
          // },
          body: {
            "selecteddate": date,
            'time': time,
          });
      print(response);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        // print(jsonString);
        /* showSnackBar(
            context: Get.context!,
            message: 'Data Fetched Successfully',
            bgColor: Colors.green);
        return true;*/
        return {'flag': true, 'data': jsonDecode(jsonString)};
      } else {
        print(response.statusCode);
        // LoginFailureResponse res = loginFailureResponseFromJson(response.body);
        /* showSnackBar(
            context: Get.context!,
            message: 'Error loading data',
            bgColor: Colors.red);*/
        return {'flag': false};
      }
    } catch (e) {
      // showSnackBar(
      //     context: Get.context!, message: e.toString(), bgColor: Colors.red);
      //  print(e);
      // return false;
      return {'flag': false};
    }
  }
}
