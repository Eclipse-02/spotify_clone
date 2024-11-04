import 'package:spotify_clone/domain/entitites/song/song.dart';

abstract class PlayListState {}

class PlayListLoading extends PlayListState {}

class PlayListLoaded extends PlayListState {
  PlayListLoaded({required this.songs});

  final List<SongEntity> songs;
}

class PlayListLoadFailure extends PlayListState {}