enum ApiMethods {
  get("GET"),
  post("POST"),
  put("PUT"),
  delete("DELETE");

  const ApiMethods(this.method);

  final String method;
}
