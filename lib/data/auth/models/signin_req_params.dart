class SignInReqParams {
  final String email;
  final String password;

  SignInReqParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }
}
