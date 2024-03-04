import 'package:flutter/material.dart';
import 'package:sdip_superapp/common/styles.dart';
import 'package:sdip_superapp/common/constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm ({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();

}

class _LoginFormState extends State<LoginForm>{
  final _formKey = GlobalKey<FormState>();

  static const List<String> pangkalan = <String>[
    "Pangkalan",
    "UIN Syarif Hidayatullah Jakarta",
    "SMKN 59 Jakarta",
    "SMK Jakarta Wisata"
  ];

  String dropdownPangkalan = pangkalan.first;

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        constraints: BoxConstraints(maxWidth: 400),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    isDense: true,
                  ),
                ),

                TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    isDense: true,
                  ),
                  obscureText: true
                ),

                SizedBox(height: 20.0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the second screen using a named route.
                        Navigator.pushNamed(context, '/profile');
                      },

                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                      child: Text('Masuk', style: ThemeText.standardBoldP),
                    ),
                  ],
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}
