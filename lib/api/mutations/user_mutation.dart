// User mutations.
class UserMutation {
  // Log the user in.
  String loginUser() {
    return """
      mutation login (\$input: LoginInput) {
        login (input: \$input) {
          user {
            id
            name
            avatar
            email
            email_verified_at
            role {
              id
              name
            }
            profile {
              firstname
              lastname              
            }
          }   
        }
      }
      """;
  }

  // Register the user.
  String createUser() {
    return """
      mutation userCreate (\$input: UserInput) {
        userCreate (input: \$input) {
          name
          email
          profile {
            firstname
            lastname
          }    
        }
      }
      """;
  }

  // User forgotten password.
  String forgottenPassword() {
    return """
      mutation forgotPassword (\$input: ForgotPasswordInput!) {
        forgotPassword (input: \$input) {
         status
         message 
        }
      }
      """;
  }

  // Update the user information
  String updateUserDetails() {
    return """ 
      mutation updateUserDetails(\$input: UserDetailsInput) {
        updateUserDetails(input: \$input) {
           status
           message 
        }
      }
    """;
  }

  // Upload the user Avatar.
  String uploadUserAvatar() {
    return """mutation uploadUserAvatar(\$id: Int!, \$file: Upload!) {
      uploadUserAvatar(id: \$id, file: \$file) {
           status
           message 
        }
    }""";
  }
}
