import './../../models/model.dart';

abstract class UserApi {

  Future getUser(String userToken);

  Future getUsers();

  Future loginUser(User user);

  Future<void> setUserToken(String token);

  Future<void> logoutUser();

 Future registerUser(User user, Profile profile,);

 Future forgottenPassword(String email);

 Future updateUserDetails(int id, User user);

 Future uploadUserAvatar(int id, dynamic imageFile);





}