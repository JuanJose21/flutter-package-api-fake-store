import 'package:dartz/dartz.dart';
import 'package:flutter_package_api_fake_store/src/global/global.dart';
import 'package:flutter_package_api_fake_store/src/models/user_model.dart';
import 'package:flutter_package_api_fake_store/src/utils/index.dart';
import 'package:http/http.dart' as http;

class UsersHttpService {
  /// Get user by id
  /// Return a [UserModel] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await usersHttpService.getUser('1');
  /// result.fold(
  ///   (error) => print(error),
  ///   (user) => print(user),
  /// );
  /// ```
  Future<Either<String, UserModel>> getUser(String idUser) async {
    try {
      final uri = Uri.parse(baseUrl + endPointUsers + idUser);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final UserModel user = userModelFromJson(response.body);
        return Right(user);
      } else {
        return Left("Error!!! ${response.statusCode}");
      }
    } catch (e) {
      return Left('Exception - getUser: $e');
    }
  }
}
