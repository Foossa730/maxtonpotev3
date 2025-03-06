import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:maxtonpotev3/components/login_button.dart';
import 'package:maxtonpotev3/components/login_textfield.dart';
import 'package:maxtonpotev3/components/square_tile.dart';
import 'package:maxtonpotev3/pages/register_page.dart';

final supabase = Supabase.instance.client;

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  //text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  //signuserin function
  void signUserIn(BuildContext context) async {
    final sm = ScaffoldMessenger.of(context);
    final authResponse = await supabase.auth.signInWithPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );

    if (authResponse.user != null) {
      sm.showSnackBar(SnackBar(
        content: Text("Logged In : ${authResponse.user!.email!}"),
      ));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DSS()), // Redirigez vers la page DSS
      );
    } else {
      sm.showSnackBar(SnackBar(
        content: Text("Login failed"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Icon(
              Icons.lock,
              size: 100.0,
            ),
            SizedBox(height: 25),
            Text(
              'Login',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            //username textfield
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            //password textfield
            SizedBox(height: 25),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 25),

            //forgot password
            Text(
              'Forgot password?',
              style: TextStyle(color: Colors.grey[800]),
            ),

            SizedBox(height: 25),
            //login button
            MyButton(
              onPressed: () =>
                  signUserIn(context), // Passez le contexte à la fonction
            ),
            SizedBox(height: 25),

            //Divider
            Row(
              children: [
                Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[700],
                    )),
                Text('Or continue with',
                    style: TextStyle(color: Colors.grey[700])),
                Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[700],
                    ))
              ],
            ),

            const SizedBox(height: 45),

            //google sign in buttons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTitle(imagePath: 'lib/assets/google.png'),
                SizedBox(height: 45),
                SquareTitle(imagePath: 'lib/assets/apple.png'),
              ],
            ),

            const SizedBox(height: 25),

            //register button
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: Text(
                'Register',
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}