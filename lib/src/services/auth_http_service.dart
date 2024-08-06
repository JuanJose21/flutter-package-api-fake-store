import 'package:dartz/dartz.dart';
import 'package:flutter_package_api_fake_store/src/global/global.dart';
import 'package:flutter_package_api_fake_store/src/models/auth_model.dart';
import 'package:flutter_package_api_fake_store/src/models/token_model.dart';
import 'package:flutter_package_api_fake_store/src/utils/index.dart';
import 'package:http/http.dart' as http;

class AuthHttpService {
  /// Login user by username and password
  /// Return a string token if success
  /// Return a string if error
  ///
  /// Example:
  /// ```dart
  /// final result = await authHttpService.login(AuthPostModel (username: 'admin', password: 'admin'));
  /// result.fold(
  ///   (error) => print(error),
  ///   (token) => print(token),
  /// );
  /// ```
  Future<Either<String, TokenModel>> login(
      AuthPostModel userCredentials) async {
    try {
      final uri = Uri.parse(baseUrl + endPointAuth);
      final response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: authPostModelToJson(userCredentials),
      );

      if (response.statusCode == 200) {
        final TokenModel token = tokenModelFromJson(response.body);
        return Right(token);
      } else {
        return Left("Error!!! ${response.statusCode} - ${response.body}");
      }
    } catch (e) {
      return Left('Exception - getUser: $e');
    }
  }
}
