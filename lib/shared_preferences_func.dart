import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveSessionId(String sessionId) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('session_id', sessionId);
}

Future<String?> getSessionId() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('session_id');
}
getIpAddress() {
    return 'http://192.168.1.10:8069';
}
