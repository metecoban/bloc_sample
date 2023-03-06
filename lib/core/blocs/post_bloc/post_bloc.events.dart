import 'package:equatable/equatable.dart';

abstract class PostBlocEvent extends Equatable {
  const PostBlocEvent();
}

class FetchPostsEvent extends PostBlocEvent {
  const FetchPostsEvent();

  @override
  List<Object?> get props => [];
}

class GoInitialEvent extends PostBlocEvent {
  const GoInitialEvent();

  @override
  List<Object?> get props => [];
}
