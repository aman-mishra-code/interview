import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../modals/newsModal.dart';


class Apis{
  Future <NewsModal> getnews() async {
    var response = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2024-11-26&sortBy=publishedAt&apiKey=9a7483522e444d069a1290961188ef19"));
    var body = jsonDecode(response.body);
    return NewsModal.fromJson(body);
  }
}