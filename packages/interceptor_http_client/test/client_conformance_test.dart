// copied form upstream package:http
// ignore_for_file: avoid_redundant_argument_values

import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;
import 'package:http_client_conformance_tests/http_client_conformance_tests.dart';
import 'package:interceptor_http_client/src/interceptor_http_client.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Interceptor Client VM conformance test',
    () {
      testAll(
        () => InterceptorHttpClient(baseClient: http.Client(), interceptors: BuiltList()),
        preservesMethodCase: false,
        canReceiveSetCookieHeaders: true,
        canSendCookieHeaders: true,
        correctlyHandlesNullHeaderValues: false,
        supportsAbort: true,
      );
    },
    onPlatform: const {
      'browser': [Skip()],
    },
  );

  group(
    'Interceptor Client browser conformance test',
    () {
      testAll(
        () => InterceptorHttpClient(baseClient: http.Client(), interceptors: BuiltList()),
        redirectAlwaysAllowed: true,
        canStreamRequestBody: false,
        canStreamResponseBody: true,
        canWorkInIsolates: false,
        supportsMultipartRequest: false,
        supportsAbort: true,
      );
    },
    onPlatform: const {
      'dart-vm': [Skip()],
    },
  );
}
