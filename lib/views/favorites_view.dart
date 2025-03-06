// lib/views/favorites_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/friends_viewmodel.dart';
import '../widgets/custom_app_bar.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    final favoriteFriends = context.watch<FriendsViewModel>().favoriteFriends;
    return Scaffold(
      appBar: customAppBar("Favoris"),
      body: favoriteFriends.isEmpty
          ? const Center(
        child: Text("Aucun favori ajouté", style: TextStyle(fontSize: 20)),
      )
          : ListView.builder(
        itemCount: favoriteFriends.length,
        padding: const EdgeInsets.symmetric(vertical: 20),
        itemBuilder: (_, index) {
          final friend = favoriteFriends[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(friend.imageUrl),
              ),
              title: Text(
                '${friend.firstName} ${friend.lastName}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(friend.description),
            ),
          );
        },
      ),
    );
  }
}
