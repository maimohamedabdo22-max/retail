import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retail/product/products.dart';

import '../cubit/favorites_cubit.dart';
import '../cubit/favorites_state.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        centerTitle: true,

        actions: [
          BlocBuilder<FavoritesCubit, FavoritesState>(
            builder: (context, state) {
              if (state.favoriteIds.isEmpty) {
                return const SizedBox();
              }

              return TextButton(
                onPressed: () {
                  _showClearDialog(context);
                },
                child: const Text(
                  'Clear all',
                  style: TextStyle(color: Colors.red),
                ),
              );
            },
          ),
        ],
      ),

      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          final favoriteProducts = products
              .where((product) => state.favoriteIds.contains(product.id))
              .toList();

          // Empty State
          if (favoriteProducts.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 80, color: Colors.grey),

                  SizedBox(height: 16),

                  Text(
                    'No favorites yet',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 8),

                  Text(
                    'Add products to your favorites',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          // Favorites List
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: favoriteProducts.length,

            itemBuilder: (context, index) {
              final product = favoriteProducts[index];

              return Dismissible(
                key: ValueKey(product.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.only(right: 20),

                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.centerRight,

                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                onDismissed: (direction) {
                  context.read<FavoritesCubit>().removeFavorite(product.id);
                },
                child: Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),

                    leading: Image.network(
                      product.image,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,

                      errorBuilder: (_, __, ___) {
                        return const SizedBox(
                          width: 70,
                          height: 70,
                          child: Icon(Icons.image),
                        );
                      },
                    ),

                    title: Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),

                    subtitle: Text('${product.price.toStringAsFixed(0)} EGP'),

                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.red),
                      onPressed: () {
                        context.read<FavoritesCubit>().removeFavorite(
                          product.id,
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _showClearDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('Clear favorites?'),

          content: const Text('Are you sure you want to remove all favorites?'),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),

            TextButton(
              onPressed: () {
                context.read<FavoritesCubit>().clearFavorites();

                Navigator.pop(dialogContext);
              },
              child: const Text('Clear', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
