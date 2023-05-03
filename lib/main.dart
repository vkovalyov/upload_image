import 'dart:async';

import 'package:flutter/material.dart';
import 'package:upload_image/src/app.dart';
import 'package:upload_image/src/core/di/repository_injection_container.dart'
as di_repository;

import 'package:upload_image/src/core/di/executor_injection_container.dart'
as di_executor;

void main() async {
  await runZonedGuarded<Future<void>>(() async {
    await _initDi();
    runApp(const MyApp());
  }, (error, stack) async {
    //todo implement send to crashlytics
    print('$error \n' 'STACK: $stack');
  });
}

Future<void> _initDi() async {
  await di_repository.init();
  await di_executor.init();
}