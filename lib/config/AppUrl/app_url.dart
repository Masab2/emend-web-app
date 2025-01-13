class AppUrl {
  static const String baseUrl = 'http://127.0.0.1:3000';
  // static const String baseUrl =
  //     'https://bmms-backend.1hq4npdw3mqn0.us-west-2.cs.amazonlightsail.com';
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

  // Genrate Email Url
  static const String generateEmail = '$baseUrl/api/generate-email';

  // Send Email Url
  static const String sendEmail = '$baseUrl/email/sendEmail';

  // Send Message Url
  static const String sendMessage = '$baseUrl/sms/messages/send';

  // Get All Contacts
  static const String getAllContactsUrl = '$baseUrl/sms/contacts/get';

  // Get Template
  static const String getAllTemplates = '$baseUrl/templates';

  // Add Single Contact in the List
  static const String addSingleContact = '$baseUrl/sms/single/contacts/add';

  // Delete List and contacts in Url
  static const String deleteListUrl = '$baseUrl/sms/lists/contacts/delete';

  // Update ListName
  static const String updateListNameUrl = "$baseUrl/sms/lists/update";

  // Create Bulk Sms Campiagns URl
  static const String createBulkSmsCampaign = '$baseUrl/sms/createsmscampaign';

  // Temp Token
  static const String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzIsImVtYWlsIjoibWFzYWJAd2F0dGxlc29sLmNvbSIsImlhdCI6MTczNjc2NzY0NCwiZXhwIjoxNzM2ODU0MDQ0fQ.9wqi0Jff-6xpRp1Ky5_d3NScw4wL8JVA7M7v1qooFmg";
}
