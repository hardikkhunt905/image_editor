import 'package:image_editor/Constants/constants.dart';

class AppUrls {
  AppUrls._();

  static String baseUrl = inDevelopment ? 'https://devapp.trakwel.com' : 'https://devapp.trakwel.com';
  static String apiBaseUrl = '$baseUrl/api/dashboard/v1/';
  static String uploadMediaUrl = '$apiBaseUrl/api/';

  static String isUserExistUrl(contact)=> '${apiBaseUrl}users/is-user-exist/$contact';

  static String loginUrl = '${apiBaseUrl}login';
  static String dashboardUrl = '${apiBaseUrl}dashboard';
  static String fabricStockUrl = '${apiBaseUrl}fabricstock';
  static String cuttingUrl = '${apiBaseUrl}cutting';
  static String supermarketStockUrl = '${apiBaseUrl}supermarketstock';
  static String issuedSewingUrl = '${apiBaseUrl}issuedsewing';
  static String sewingPcsUrl = '${apiBaseUrl}sewingpcs';
  static String sewingEffUrl = '${apiBaseUrl}sewingeff';
  static String sewingDhuUrl = '${apiBaseUrl}sewingdhu';
  static String finishingUrl = '${apiBaseUrl}finishing';
  static String packingUrl = '${apiBaseUrl}packing';
}