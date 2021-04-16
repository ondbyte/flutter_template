class UserQuery {
  // Get all titles.
  String getTitles() {
    return """
      query {
        titles {
          id
          name  
        }
      }""";
  }

  // Get all locations.
  String getLocations() {
    return """
      query {
        sites {
          id
          name  
        }
      }""";
  }

  // Get all professions.
  String getProfessions() {
    return """
      query {
        professions {
          id
          title
        }
      }""";
  }

  String getNationalities() {
    return """ query {
            nationalities {
              id
              name
            }
        }""";
  }

  // Get all users
  String getUsers() {
    return """
      query {
        users {
          id
          name  
          email
        }
      }""";
  }

  // Get a single user from ID.
  String getUser() {
    return """
      query user (\$id: ID!){
        user (id: \$id) {
          id
          name
          email
          avatar         
          role {
            id
            name
          }
          profile {
            firstname
            lastname            
          }
        }
      }""";
  }

  String getDeliveries() {
    return """ 
    query getDeliveries(\$id: Int) {
      getDeliveries(id: \$id) {
        id
        delivery_time
      }
    } 
    """;
  }
}
