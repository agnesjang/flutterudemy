import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      image: AssetImage('assets/background.jpg'),
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
        decoration: InputDecoration(
            labelText: 'E-Mail', filled: true, fillColor: Colors.white),
        keyboardType: TextInputType.emailAddress,
        onChanged: (String value) {
          setState(() {
            _emailValue = value;
          });
        });
  }

  Widget _buildPasswordTextField() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            labelText: 'Password', filled: true, fillColor: Colors.white),
        onChanged: (String value) {
          setState(() {
            _passwordValue = value;
          });
        });
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      title: Text("Accept Terms"),
      value: _acceptTerms,
      onChanged: (bool value) {
        setState(() {
          _acceptTerms = value;
        });
      },
    );
  }

  _submitForm() {
    print(_emailValue);
    print(_passwordValue);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth  > 768.0 ? 500.0 : deviceWidth * 0.95;

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
          decoration: BoxDecoration(image: _buildBackgroundImage()),
          padding: EdgeInsets.all(10.0),
          child: Center(
              child: SingleChildScrollView(
                  child: Container(
                    width: targetWidth,
                      child: Column(
            children: <Widget>[
              _buildEmailTextField(),
              SizedBox(height: 10.0),
              _buildPasswordTextField(),
              _buildAcceptSwitch(),
              SizedBox(height: 10.0),
              RaisedButton(
                child: Text('LOGIN'),
                color: Theme.of(context).primaryColor,
                onPressed: _submitForm,
              ),
            ],
          ))))),
    );
  }
}
