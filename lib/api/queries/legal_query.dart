class LegalQuery {
  String getLegalInfo() {
    return """
            query {
              legalInformation {
                id
                name
                description 
                slug 
                link
                order
              }
            }
            """;
  }
}
