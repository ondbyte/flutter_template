import './../../models/model.dart';

abstract class LegalApi {

  Future<List<Legal>> getLegalInfo();

}