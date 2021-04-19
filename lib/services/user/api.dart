import './../../models/model.dart';

abstract class UserApi {

  Future<dynamic> getUser(int userId);

  Future<dynamic> getUsers();

  Future<Message> loginUser(User user);

 Future<Message> registerUser(User user, Profile profile,);

 Future<Message> forgottenPassword(String email);

 Future<Message> updateUserDetails(int id, User user);

 Future<Message> uploadUserAvatar(int id, dynamic imageFile);





}