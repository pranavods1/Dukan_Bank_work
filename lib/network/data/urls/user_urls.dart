class UserUrls {
  // സർവറിന്റെ മെയിൻ ലിങ്ക് (Base URL)
  static const String baseUrl = 'https://dummyjson.com';

  // നമ്മൾ വിളിക്കേണ്ട എൻഡ്‌പോയിന്റ് (Relative Path)
  static const String fetchUsers = '/users';

  // ഒരു സിംഗിൾ യൂസറുടെ ഡീറ്റെയിൽസ് എടുക്കാനുള്ള ലിങ്ക്
  static String fetchUserDetails(int id) => '/users/$id';
}
