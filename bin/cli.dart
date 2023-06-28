// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:cli/cli.dart';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
//   String jsonBody = '''{
// "requestData":"165249_intelect"
// }''';
//   String sso_auth_data = EncryptDecrypt().encryption(jsonBody).base64;
//   print("SSO_AUTH_DATA= $sso_auth_data");

//   http.Response response = await sso_auth(
//       "https://adportalapiuat2access.go.akamai-access.com/axisdirect_login/app/index.php/sso/auth",
//       sso_auth_data);
//   String sso_auth_response = jsonDecode(response.body)["responseData"];
//   print(sso_auth_response);
//   Map decrypted_sso_auth_response =
//       jsonDecode(EncryptDecrypt().decryption(sso_auth_response));
//   print(decrypted_sso_auth_response);
//   String token = decrypted_sso_auth_response["data"]["token"];

//   http.Response get_tcs_token_response = await http.get(Uri.parse(
//       "https://tcsfoapiuatacess.go.akamai-access.com/600k/InterfaceAccess.do?requestType=getClientAuthTokenValue&responseType=JSON&entityId=165249&portalTokenId=952411&IPAddress=103.232.237.67&authType=E_A01"));
//   print(jsonDecode(get_tcs_token_response.body));
//   String tcs_token = jsonDecode(get_tcs_token_response.body)["ARSP_TOKEN_KEY"];

//   String sso_validate_uri =
//       '165249_intelect_${token}_las_${tcs_token}_intelect_14370717';
//   print(sso_validate_uri);
//   String sso_auth_param = EncryptDecrypt().encryption(sso_validate_uri).base64;

//   print(sso_auth_param);

//   http.Response sso_validate_response = await httpPostWithHeaderNoBody(
//       "https://adportalapiuat2access.go.akamai-access.com/axisdirect_login/app/index.php/sso/ValidateUserSSO?requestData=$sso_auth_param");

//   print(sso_validate_response.body);

  // print(EncryptDecrypt().encryption("165249_intelect").base64);
  // Codec<String, String> stringToBase64 = utf8.fuse(base64);
  // print(stringToBase64.encode())
  print(EncryptDecrypt().decryption(
      "KuIXGdzOfpozj2ngCUfm9VjEGWLHWvYwrqlBeGKyOlYpkF7N3VC2NVu2shcErM7g5oOLZjfnkTw2Am3sIG2RiHZfZ0hXMMiF2ZnD9IUiutn5fO2Q/xhHuzYVD7wFYXSa"));
}

sso_auth(String url, String requestData) async {
  Map<String, dynamic> requestJson = {"requestData": requestData};
  http.Response response = await httpPostWithHeader(url, requestJson);
  return response;
}

httpPostWithHeader(url, Map body) async {
  var response =
      await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
    'api-key': 'ASLRT647JLSATR89EQP',
    'client-key': 'intelect',
    'Content-type': 'application/json'
  });
  return response;
}

httpPostWithHeaderNoBody(url) async {
  var response = await http.post(Uri.parse(url), headers: {
    'api-key': 'ASLRT647JLSATR89EQP',
    'client-key': 'intelect',
  });
  return response;
}
