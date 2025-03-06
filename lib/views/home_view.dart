// lib/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../models/my_friend.dart';
import '../viewmodels/friends_viewmodel.dart';
import '../widgets/custom_app_bar.dart';
import 'map_view.dart';
import 'favorites_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Exemple de liste d'amis statique
    final List<MyFriend> friends = [
      MyFriend(
        firstName: "Jean",
        lastName: "Dupont",
        description: "Fan de randonnée",
        imageUrl: "https://randomuser.me/api/portraits/men/1.jpg",
        statusColor: Colors.green,
      ),
      MyFriend(
        firstName: "Marie",
        lastName: "Curie",
        description: "Passionnée de science",
        imageUrl: "https://randomuser.me/api/portraits/women/2.jpg",
        statusColor: Colors.blue,
      ),
    ];

    final friendsVM = context.watch<FriendsViewModel>();

    return Scaffold(
      appBar: customAppBar("Max Ton Pote"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const MapView()),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: const Icon(Icons.map_sharp, color: Colors.white, size: 40),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            navIcon(Icons.home, () {}),
            navIcon(
              Icons.favorite,
                  () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const FavoritesView(),
                ),
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: friends.length,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          final friend = friends[index];
          final isFavorite = friendsVM.favoriteFriends.contains(friend);
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(friend.imageUrl),
                radius: 30,
              ),
              title: Text('${friend.firstName} ${friend.lastName}'),
              subtitle: Text(friend.description),
              trailing: IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
                onPressed: () => friendsVM.toggleFavorite(friend),
              ),
            ),
          );
        },
      ),
    );
  }

  IconButton navIcon(IconData icon, VoidCallback onPressed) => IconButton(
    onPressed: onPressed,
    icon: Icon(icon, color: Colors.white, size: 40),
  );
}
