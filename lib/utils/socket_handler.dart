import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SocketHandler {
  void handler(DioError e, context) {
    if (DioErrorType.other == e.type) {
      if (e.message.contains('SocketException')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              TimeoutException(
                      'No internet connection please connect to internet')
                  .message!,
            ),
          ),
        );
        throw TimeoutException('no internet');
      }
    }
  }
}
