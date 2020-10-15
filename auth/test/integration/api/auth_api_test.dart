import 'package:auth/src/domain/credential.dart';
import 'package:auth/src/infra/api/auth_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  AuthApi sut;
  http.Client client;
  String baseUrl = 'http://localhost:3000';
  setUp(() {
    client = http.Client();

    sut = AuthApi(baseUrl, client);
  });

  group('signin', () async {
    test('should return json web token when succesful', () async {
      //arrange
      var credential = Credential(
          type: AuthType.email,
          email: 'newuser@email.com',
          password: 'pass123');

      //act
      var result = await sut.signIn(credential);

      //assert
      expect(result.asValue.value, isNotEmpty);
    });
  });
}
