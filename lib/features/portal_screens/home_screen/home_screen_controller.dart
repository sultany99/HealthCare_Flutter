import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';

import 'package:hc_2/shared_preferences_func.dart';
import 'package:http/http.dart' as http;

import 'package:hc_2/features/portal_screens/home_screen/department_model.dart';
import 'package:hc_2/features/portal_screens/home_screen/doctor_model.dart';

class HomeScreenController {
  doRequest(Map<String, Object> params, String endPoint) async {
    var sission_id = await getSessionId();
    print("sadasdas $sission_id");
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'session_id=$sission_id'
    };
    var request =
        http.Request('POST', Uri.parse('${getIpAddress()}$endPoint'));
    request.body = json.encode({"jsonrpc": "2.0", "params": params});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = jsonDecode(await response.stream.bytesToString());
      print(res['result']);
      return res['result']; //['success']
      // return {'success': true};
    } else {
      print(response.reasonPhrase);
      print("false sadasdasdasd");
      return {'error': response.reasonPhrase};
    }
  }

  getDepartments() async {
    var response = await doRequest({}, '/api/hc/departments');
    print("asdasdasdasdasdaszzzzzzzzzzzzz $response['departments']");
    var listOfDepartments = response['departments']
        .map((map) => DepartmentModel.fromMap(map))
        .toList();
    return listOfDepartments;
  }

  getDepartmentInfo() async {
    var response = await doRequest({}, '/api/hc/department_info');

    return {'id': 1, "name": "تجميل", "color": "#0000"};
  }

  getDoctors(var doctorSearch, var departmentId) async {
    print("dasdasdasdasdddddddddddddddddddd $doctorSearch $departmentId");
    if (departmentId == -1){
      departmentId = false;
    }

    if (doctorSearch == ''){
      doctorSearch = false;
    }

    var response =
        await doRequest({'name':doctorSearch,'department': departmentId}, '/api/hc/employees');

    var listOfDoctorts =
        response['employees'].map((map) => DoctorModel.fromMap(map)).toList();
    return listOfDoctorts;
  }

  Future<Uint8List> assetImageToUint8List(String assetPath) async {
    // Load the image as a ByteData
    ByteData byteData = await rootBundle.load(assetPath);

    // Convert ByteData to Uint8List
    Uint8List imageData = byteData.buffer.asUint8List();

    return imageData;
  }
}
