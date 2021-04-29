// User queries.
class UserQuery {
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
      query me {
        me {
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

}
