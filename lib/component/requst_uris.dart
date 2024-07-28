enum RequestUris {
  signin('/memos.api.v1.AuthService/SignIn');

  final String uri;

  const RequestUris(this.uri);
}
