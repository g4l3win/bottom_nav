
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiService {
  // Fungsi untuk mengambil data dari API
  Future<String> onBasicGetSource({required String url}) async {
    http.Response response = await http.get(Uri.parse(url));
    String rescode = response.statusCode.toString();
    String tempresult = '';
    String result = 'Error';

    log('data ${response.body}');

    if (response.statusCode == 200 &&
        !response.body.toUpperCase().contains('INVALID TOKEN') &&
        !response.body.toUpperCase().contains('UNAUTORIZED') &&
        !response.body.toUpperCase().contains('SERVER UNAVAILABLE')) {
      result = response.body;
    } else if (response.statusCode == 400) {
      tempresult = 'Error $rescode, Bad Request';
    } else if (response.statusCode == 401) {
      tempresult = 'Error $rescode, Unauthorized';
    } else if (response.statusCode == 404) {
      tempresult = 'Error $rescode, Not Found';
    } else if (response.statusCode == 500) {
      tempresult = 'Error $rescode, Internal Server Error';
    } else if (response.statusCode == 502) {
      tempresult = 'Error $rescode, Bad Gateway';
    } else if (response.statusCode == 503) {
      tempresult = 'Error $rescode, Service Unavailable';
    } else if (response.body.contains('INVALID TOKEN')) {
      tempresult = 'Error $rescode';
    } else {
      tempresult = 'Error $rescode';
    }

    result = tempresult.toLowerCase().contains('error')
        ? "$tempresult ${response.body}"
        : response.body;
    return result;
  }
}