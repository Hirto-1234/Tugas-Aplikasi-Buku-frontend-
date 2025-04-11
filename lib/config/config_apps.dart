class ConfigApps {
  static const String url = 'http://192.168.0.102:8000/api';

  static const String login = '$url/auth/login';
  static const String register = '$url/auth/register';
  static const String logout = '/auth/logout';
  static const String checkStatus = '/auth/checkstatus';

  static const String listUser = '/user';
  static const String detailBuku = '/user/detail';
  static const String addBuku = '/user/add';
}
