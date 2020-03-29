import 'package:flutter/material.dart';
import 'auth_fireship.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Parkcore Login',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Parkcore'),
              backgroundColor: Colors.amber,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Icon(Icons.home),
              backgroundColor: Theme.of(context).backgroundColor,
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () => authService.googleSignIn(),
                    color: Colors.white,
                    textColor: Colors.black,
                    child: Text('Login with google'),
                  ),
                  MaterialButton(
                    onPressed: () => authService.signOut(),
                    color: Colors.red,
                    textColor: Colors.black,
                    child: Text('Sign out'),
                  ),
                  UserProfile(),
                ],
              ),
            )));
  }
}

class UserProfile extends StatefulWidget {
  @override
  UserProfileState createState() => UserProfileState();
}

class UserProfileState extends State<UserProfile> {
  Map<String, dynamic> _profile;
  bool _loading = false;

  @override
  initState() {
    super.initState();
    authService.profile.listen((state) => setState(() => _profile = state));
    authService.loading.listen((state) => setState(() => _loading = state));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(padding: EdgeInsets.all(20), child: Text(_profile.toString())),
      Text(_loading.toString())
    ]);
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authService.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialButton(
              onPressed: () => authService.signOut(),
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Signout'),
            );
          } else {
            return MaterialButton(
              onPressed: () => authService.googleSignIn(),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Login with Google'),
            );
          }
        });
  }
}
