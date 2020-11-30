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
  static configure() {
    _localStore = LocalStore(_sharedPreferences);

    // if (Platform.isAndroid) {
    //   // android backend ip
    //   _baseUrl = "http://10.0.2.2:3000";
    // } else {
      // web backend ip

    // }
  }

  static Widget composeAuthUi() {

    AuthCubit _authCubit = AuthCubit(_localStore);

    return CubitProvider(
      create: (BuildContext context) => _authCubit,
      child: AuthPage(),
    );
  }
}
