import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'applications.dart';
import 'common/app_session.dart';
import 'data/cubit/app_cubit.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'data/cubit/navigator/navigator_cubit.dart';
import 'data/repository/graphql_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSession().init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MyApp()));
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {

  GraphQLConfiguration graphQLConfig = new GraphQLConfiguration();

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphQLConfig.client,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
            create: (context) => AppCubit(),
          ),
          BlocProvider<NaCubit>(
            create: (context) => NaCubit(),
          )
        ],
        child: Application(),
      ),
    );
  }
}