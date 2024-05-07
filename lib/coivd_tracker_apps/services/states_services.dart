import 'dart:convert';

import 'package:flutter_roadmap/coivd_tracker_apps/model/worldStateModel.dart';
import 'package:flutter_roadmap/coivd_tracker_apps/services/utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices {
  static Future<WorldStateModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(ApiUrl.worldStatesApi));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

   Future<List<dynamic>> countriesWiseList() async {
    var data;
    final response = await http.get(Uri.parse(ApiUrl.countriesList));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Error');
    }
  }


}
