enum RequestUris {
  signin('/api/v1/auth/signin');

  final String uri;

  const RequestUris(this.uri);
}
