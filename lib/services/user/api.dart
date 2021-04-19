import './../../models/model.dart';

abstract class UserApi {

  Future<User> getUser(int userId);

  Future<List<User>> getUsers();

  Future<Message> loginUser(User user);

  Future<Message> registerUser(User user, Profile profile, int location, int profession, String token, bool email, bool app, bool text);

  Future<Message> forgottenPassword(String email);

  Future<Message> updateUserDetails(int id, User user);

  Future<Message> uploadUserAvatar(int id, dynamic imageFile);

}