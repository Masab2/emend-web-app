class AppUrl {
  static const String baseUrl = 'http://192.168.0.107:3000';

  // Create List Url
  static const String createList = '$baseUrl/sms/lists/create';

  // Create Contact in List Url
  static const String createContact = '$baseUrl/sms/lists/upload-contacts';

  // Get List Api Url
  static const String getList = '$baseUrl/sms/lists/fetch';

  // Update Contacts Details Url
  static const String updateContact = '$baseUrl/sms/lists/update-contacts';

  // Temp Token
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MywiZW1haWwiOiJtaGRldnM0NzcwQGdtYWlsLmNvbSIsImlhdCI6MTczNTU3NjkwNywiZXhwIjoxNzM1NjA5MzA3fQ.vglpZ_pPPLbYP_xjHpm302sQ3fU2cBJzBl7Lvfy9CZ0";
}
