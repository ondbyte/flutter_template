import '../../../models/model.dart';

abstract class UserApi {

  Future<User> getUser(int userId);

  Future<List<User>> getUsers();

}