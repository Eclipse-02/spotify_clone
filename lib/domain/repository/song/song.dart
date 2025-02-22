import 'package:dartz/dartz.dart';

abstract class SongsRepository {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
  Future<Either> addorRemoveFavoriteSongs(String songId);
  Future<bool> isFavoriteSong(String songId);
  Future<Either> getUserFavoriteSongs();
}