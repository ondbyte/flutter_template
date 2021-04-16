// Application queries.
class ApplicationQuery {
  // Get the application information.
  String getApplicationData() {
    return """
            query {
              application {
                name
                environment
              }
            }
      """;
  }
}
