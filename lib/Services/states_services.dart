// ignore_for_file: unused_import, unused_local_variable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Services/Utilities/app_url.dart';
import '../Models/countries_states_model.dart';
import '../Models/world_states_model.dart';
import 'dart:convert';
import 'dart:io';

class StatesServices {
  Future<WorldStatesModel> getWorldStatesApi() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesUrl));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }

  Future<List<dynamic>> getCountriesStateApi() async {
    final response = await http.get(Uri.parse(AppUrl.countriesUrl));
    var data;
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");
    }
  }
}
