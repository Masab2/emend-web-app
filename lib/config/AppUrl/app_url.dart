class AppUrl {
  static const String baseUrl = 'http://127.0.0.1:3000';
  // static const String baseUrl = 'https://bmms-backend.1hq4npdw3mqn0.us-west-2.cs.amazonlightsail.com';
  // Auth Urls
  static String login(token) => '$baseUrl/auth/signin?token=$token';
  static const String register = '$baseUrl/auth/signup';

  // Create List Url
  static const String createList = '$baseUrl/sms/lists/create';

  // Create Contact in List Url
  static const String createContact = '$baseUrl/sms/lists/upload-contacts';

  // Get List Api Url
  static const String getList = '$baseUrl/sms/lists/fetch';

  // Update Contacts Details Url
  static const String updateContact = '$baseUrl/sms/lists/update-contacts';
  
  // Generate Sms Message Url
  static const String generateSmsMessage = '$baseUrl/api/generate-sms';
  // Temp Token
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NCwiZW1haWwiOiJtaGRldnM0NzcwQGdtYWlsLmNvbSIsImlhdCI6MTczNTY2MTQ2MSwiZXhwIjoxNzM1NjkzODYxfQ.s7OUrnbSEsU7VC5OBqAnjaP_K5swg86PS6al0taYcQ0";
}
