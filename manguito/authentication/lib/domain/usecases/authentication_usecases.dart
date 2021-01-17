import 'package:meta/meta.dart';

import '../entities/entities.dart';

abstract class AuthenticationUsecases {
  Future<AccountEntity> auth({
    @required String email,
    @required String password,
  });
}
