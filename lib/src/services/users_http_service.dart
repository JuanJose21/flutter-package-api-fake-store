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
  Future<Either<String, UserModel>> getUser(int idUser) async {
    try {
      final uri = Uri.parse('$baseUrl$endPointUsers/$idUser');
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final UserModel user = UserModel.userModelFromJson(response.body);
        return Right(user);
      } else {
        return Left("Error!!! ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      return Left('Exception - getUser: $e');
    }
  }

  /// Add new user
  /// Return a [UserModel] if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await usersHttpService.addUser(UserModel(
  ///   email: 'mail@mail.com'
  ///   username: 'user1',
  ///   password: '123456'
  ///   name: NameModel(
  ///     first: 'User',
  ///     last: 'One',
  ///   ),
  ///   address: AddressModel(
  ///     city: 'City 1',
  ///     street: 'Street 1',
  ///     number: 1,
  ///     zipcode: 'Zipcode 1',
  ///     geo: GeoModel(
  ///       lat: 'Lat 1',
  ///       long: 'Lng 1',
  ///     ),
  ///   ),
  ///   phone: 'Phone 1',
  /// ));
  /// result.fold(
  ///   (error) => print(error),
  ///   (user) => print(user),
  /// );
  /// ```
  Future<Either<String, UserModel>> addUser(UserModel user) async {
    try {
      final uri = Uri.parse(baseUrl + endPointUsers);
      final response = await http.post(uri,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: UserModel.userAddModelToJson(user));

      if (response.statusCode == 200) {
        final UserModel user = UserModel.userAddModelFromJson(response.body);
        return Right(user);
      } else {
        return Left("Error!!! ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      return Left('Exception - addUser: $e');
    }
  }
}
