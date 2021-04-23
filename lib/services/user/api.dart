import './../../models/model.dart';

abstract class UserApi {

  Future getUser(int userId);

  Future getUsers();

  Future loginUser(User user);

 Future registerUser(User user, Profile profile,);

 Future forgottenPassword(String email);

 Future updateUserDetails(int id, User user);

 Future uploadUserAvatar(int id, dynamic imageFile);





}