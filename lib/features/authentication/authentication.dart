import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hc_2/shared_preferences_func.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

class Authentication {
  login(String userName, String password) async {
    if (kDebugMode) {
      print("asdasdasdasdasdas");
    }
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse('${getIpAddress()}/api/login'));
    request.body = json.encode({
      "jsonrpc": "2.0",
      "params": {"db": "HealthCare", "login": userName, "password": password}
    });
    request.headers.addAll(headers);
    print("asdasdasdasdasdas1");

    http.StreamedResponse response = await request.send();
    print("asdasdasdasdasdas2");
    if (response.statusCode == 200) {
        print("asdasdasdasdasdasd kjkj ${response.headers}");

        // print(await response.stream.bytesToString());
        print("asdasdasdasdasdasd kjkj");
        var res = jsonDecode(await response.stream.bytesToString());
        print(res['result']);

        print("asdasdasdasdasdasd kjkjjhgjhgjh ${response.headers['set-cookie']}");
        String? inputString = response.headers['set-cookie'];

        // Regular expression to find the session ID
        RegExp regExp = RegExp(r'session_id=([a-f0-9]+)');
        Match? match = regExp.firstMatch(inputString!);
        String sessionId = '';
        if (match != null) {
          sessionId = match.group(1)!;
          print("Session ID: $sessionId");
        } else {
          print("Session ID not found.");
        }
        await saveSessionId(sessionId
        );
      return res['result'];//['success']
    } else {
      print(response.reasonPhrase);
      print("false sadasdasdasd");
      return {'error': response.reasonPhrase};
    }
  }
  restorePassword(String userName, String password) async {
    if (kDebugMode) {
      print("asdasdasdasdasdas");
    }
    // var headers = {'Content-Type': 'application/json'};
    // var request =
    //     http.Request('POST', Uri.parse('http://192.168.1.105:8017/api/restore_password'));
    // request.body = json.encode({
    //   "jsonrpc": "2.0",
    //   "params": {"db": "db", "login": "test", "password": "123"}
    // });
    // request.headers.addAll(headers);
    // print("asdasdasdasdasdas1");
    //
    // http.StreamedResponse response = await request.send();
    // print("asdasdasdasdasdas2");
    //
    // if (response.statusCode == 200) {
    if (true) {
      //   print("asdasdasdasdasdasd kjkj");
      //
      //   // print(await response.stream.bytesToString());
      //   print("asdasdasdasdasdasd kjkj");
      //   var res = jsonDecode(await response.stream.bytesToString());
      //   print(res['result']);
      // return res['result'];//['success']
      return {'success': true};
    } else {
      // print(response.reasonPhrase);
      // print("false sadasdasdasd");
      // return {'error': response.reasonPhrase};
    }
  }
  register(String userName, String password) async {
    if (kDebugMode) {
      print("asdasdasdasdasdas");
    }
    // var headers = {'Content-Type': 'application/json'};
    // var request =
    //     http.Request('POST', Uri.parse('http://192.168.1.105:8017/api/restore_password'));
    // request.body = json.encode({
    //   "jsonrpc": "2.0",
    //   "params": {"db": "db", "login": "test", "password": "123"}
    // });
    // request.headers.addAll(headers);
    // print("asdasdasdasdasdas1");
    //
    // http.StreamedResponse response = await request.send();
    // print("asdasdasdasdasdas2");
    //
    // if (response.statusCode == 200) {
    if (true) {
      //   print("asdasdasdasdasdasd kjkj");
      //
      //   // print(await response.stream.bytesToString());
      //   print("asdasdasdasdasdasd kjkj");
      //   var res = jsonDecode(await response.stream.bytesToString());
      //   print(res['result']);
      // return res['result'];//['success']
      return {'success': true};
    } else {
      // print(response.reasonPhrase);
      // print("false sadasdasdasd");
      // return {'error': response.reasonPhrase};
    }
  }
}
