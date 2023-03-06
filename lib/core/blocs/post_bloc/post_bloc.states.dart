import 'package:bloc_sample/core/models/post_model.dart';
import 'package:equatable/equatable.dart';

class PostBlocState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PostBlocInitialState extends PostBlocState {}

class PostBlocLoadingState extends PostBlocState {}

class PostBlocLoadedState extends PostBlocState {
  List<PostModel> postsResponse;
  PostBlocLoadedState(this.postsResponse);
}

class PostBlocErrorState extends PostBlocState {
  String e;
  PostBlocErrorState(this.e);
}
