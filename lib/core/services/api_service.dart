import 'package:bloc_sample/core/services/retrofit/retrofit_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  static final ApiService _singletonUserRepository = ApiService._internal();

  factory ApiService() {
    return _singletonUserRepository;
  }

  ApiService._internal();

  Future<dynamic>? getPosts() async {
    try {
      return await RetrofitClient(Dio()).getPosts();
    } catch (e) {
      return e.toString();
    }
  }
}
