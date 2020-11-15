import 'dart:io';

import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';
import 'package:diveapp/cache/local_store.dart';
import 'package:diveapp/states_management/auth/auth_cubit.dart';
import 'package:diveapp/pages/auth_page.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cache/local_store_contract.dart';

class CompositionRoot {
  static SharedPreferences _sharedPreferences;
  static ILocalStore _localStore;
  static String _baseUrl;
  static Client _client;

  static configure() {
    _localStore = LocalStore(_sharedPreferences);
    _client = Client();
    if (Platform.isAndroid) {
      // android backend ip
      _baseUrl = "http://10.0.2.2:3000";
    } else {
      // web backend ip
      _baseUrl = "http://localhost:3000";
    }
  }

  static Widget composeAuthUi() {
    IAuthApi _api = AuthApi(_baseUrl, _client);
    AuthManager _manger = AuthManager(_api);
    AuthCubit _authCubit = AuthCubit(_localStore);
    ISignUpService _signupService = SignUpService(_api);

    return CubitProvider(
      create: (BuildContext context) => _authCubit,
      child: AuthPage(_manger, _signupService),
    );
  }
}
