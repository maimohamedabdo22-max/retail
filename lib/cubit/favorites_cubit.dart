import 'package:flutter_bloc/flutter_bloc.dart';
import 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(const FavoritesState());

  void toggleFavorite(String productId) {
    final updatedFavorites = Set<String>.from(state.favoriteIds);

    if (updatedFavorites.contains(productId)) {
      updatedFavorites.remove(productId);
    } else {
      updatedFavorites.add(productId);
    }

    emit(state.copyWith(favoriteIds: updatedFavorites));
  }

  void removeFavorite(String productId) {
    final updatedFavorites = Set<String>.from(state.favoriteIds);

    updatedFavorites.remove(productId);

    emit(state.copyWith(favoriteIds: updatedFavorites));
  }

  void clearFavorites() {
    emit(state.copyWith(favoriteIds: {}));
  }

  bool isFavorite(String productId) {
    return state.favoriteIds.contains(productId);
  }

  int get favoritesCount {
    return state.favoriteIds.length;
  }
}
