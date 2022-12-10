import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyrix/Screen/homescreen.dart';
import 'package:lyrix/core/Constant/string.dart';
import 'package:lyrix/data/data_provider.dart';
import 'package:lyrix/data/dio/dio.dart';

import '../logic/cubit/musix_cubit/musix_cubit.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreenRoute:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => MusixCubit(
                  dataProvider: DataProvider(
                    dioClient: DioClient(),
                  ),
                ),
              ),
            ],
            child: Homescreen(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
