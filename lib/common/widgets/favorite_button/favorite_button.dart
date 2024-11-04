import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:spotify_clone/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/domain/entitites/song/song.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.songEntity,
    this.function
  });

  final SongEntity songEntity;
  final Function ? function;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
              onPressed: () async {
                await context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                  songEntity.songId
                );
                if (function != null) {
                  function!();
                }
              },
              // ignore: prefer_const_constructors
              icon: Icon(
                songEntity.isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
                color: AppColors.darkGrey,
              )
            );
          }

          if (state is FavoriteButtonUpdated) {
            return IconButton(
              onPressed: () {
                context.read<FavoriteButtonCubit>().favoriteButtonUpdated(
                  songEntity.songId
                );
              },
              // ignore: prefer_const_constructors
              icon: Icon(
                state.isFavorite ? Icons.favorite : Icons.favorite_outline_outlined,
                color: AppColors.darkGrey,
              )
            );
          }

          return Container();
        }
      ),
    );
  }
}