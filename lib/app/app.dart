import 'package:bloc_sample/app/views/home.view.dart';
import 'package:bloc_sample/core/blocs/post_bloc/post_bloc.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<PostBloc>(create: (BuildContext context) => PostBloc())
          ],
          child: const HomeView(),
        ));
  }
}
