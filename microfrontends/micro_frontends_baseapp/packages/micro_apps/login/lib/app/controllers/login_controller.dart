class LoginController {
  Future<bool> login(String user, String pass) async{
    return user == 'admin' && pass == '123';
  }
}
