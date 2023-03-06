import 'package:bloc_sample/core/blocs/post_bloc/post_bloc.events.dart';
import 'package:bloc_sample/core/blocs/post_bloc/post_bloc.states.dart';
import 'package:bloc_sample/core/services/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostBlocEvent, PostBlocState> {
  PostBloc() : super(PostBlocInitialState()) {
    on<FetchPostsEvent>((event, emit) async {
      emit(PostBlocLoadingState());
      var postsResponse = await ApiService().getPosts();
      if (postsResponse.runtimeType != String) {
        emit(PostBlocLoadedState(postsResponse));
      } else {
        emit(PostBlocErrorState(postsResponse));
      }
    });

    on<GoInitialEvent>((event, emit) async {
      emit(PostBlocInitialState());
    });
  }
}
