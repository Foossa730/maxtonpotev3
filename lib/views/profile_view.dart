import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Profil Utilisateur"),
      body: Column(
        children: const [
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/3.jpg'),
          ),
          SizedBox(height: 20),
          Text('John Doe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text('john.doe@example.com', style: TextStyle(fontSize: 16, color: Colors.grey)),
          SizedBox(height: 20),
          Text('Téléphone : +33 6 12 34 56 78'),
          Text('Adresse : 123 Rue de la Paix, Paris'),
          SizedBox(height: 20),
          Text('Bio : Passionné par la technologie et les voyages.'),
        ],
      ),
    );
  }
}
