import 'package:bloc_sample/core/blocs/post_bloc/post_bloc.bloc.dart';
import 'package:bloc_sample/core/blocs/post_bloc/post_bloc.events.dart';
import 'package:bloc_sample/core/blocs/post_bloc/post_bloc.states.dart';
import 'package:bloc_sample/core/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Sample'),
      ),
      body: BlocBuilder<PostBloc, PostBlocState>(builder: (context, state) {
        if (state is PostBlocInitialState) {
          return Center(
            child: ElevatedButton(
                onPressed: () {
                  context.read<PostBloc>().add(const FetchPostsEvent());
                },
                child: const Text("Fetch Posts")),
          );
        }
        if (state is PostBlocLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }

        if (state is PostBlocLoadedState) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                child: ListView.builder(
                    itemCount: state.postsResponse.length,
                    itemBuilder: (context, index) {
                      PostModel post = state.postsResponse[index];
                      return Card(
                          child: ListTile(
                        leading: CircleAvatar(child: Text(post.id.toString())),
                        title: Text(post.title.toString()),
                      ));
                    }),
              ),
              Expanded(
                child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<PostBloc>().add(const GoInitialEvent());
                      },
                      child: const Text('Go Initial Page')),
                ),
              )
            ],
          );
        }

        return const Center(child: Text('Error Occured'));
      }),
    );
  }
}
