import '../../Photo.dart';

abstract class PhotoApiRepository{
  Future<List<Photo>> fetch(String query);
}