import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:hc_2/features/portal_screens/appoinment_screen/appointment_model.dart';
import 'package:hc_2/features/portal_screens/home_screen/department_model.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctor_model.dart';
import 'package:hc_2/shared_preferences_func.dart';

class AppointmentScreenController {
  doRequest(Map<String, Object> params, String endPoint) async {
    var sission_id = await getSessionId();
    print("sadasdas $sission_id");
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'session_id=$sission_id'
    };
    var request = http.Request('POST', Uri.parse('${getIpAddress()}$endPoint'));
    request.body = json.encode({"jsonrpc": "2.0", "params": params});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = jsonDecode(await response.stream.bytesToString());
      print("asdasdasdasdasdas ${res['result']}");
      return res['result']; //['success']
      // return {'success': true};
    } else {
      print(response.reasonPhrase);
      print("false sadasdasdasd");
      return {'error': response.reasonPhrase};
    }
  }

  getAppointments() async {
    print("asdasdasd");
    var response = await doRequest({}, '/api/hc/get/patient/appointments');
    print("asdasdasdpppppppppppppppppppkkkkkkk $response");

    var listOfDepartments =
        response.map((map) => AppointmentModel.fromMap(map)).toList();
    return listOfDepartments;
  }

  setAppointment(var params) async {
    print("asdasdasdiiiiiiiiiiiiii $params");
    var response = await doRequest(params, '/api/hc/create/appointment');

    return response;
  }
}
