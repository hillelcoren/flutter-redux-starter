import 'package:flutter/material.dart';
import 'package:flutter_redux_starter/keys.dart';
import 'package:flutter_redux_starter/redux/auth/auth_state.dart';

class LoginView extends StatefulWidget {
  final bool isLoading;
  final AuthState authState;
  final Function(BuildContext, String, String) onLoginPressed;

  LoginView({
    Key key,
    @required this.isLoading,
    @required this.authState,
    @required this.onLoginPressed,
  }) : super(key: key);

  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<LoginView> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  static final ValueKey _emailKey = new Key(LoginKeys.emailKey);
  static final ValueKey _passwordKey = new Key(LoginKeys.passwordKey);

  @override
  void didChangeDependencies() {
    _emailController.text = widget.authState.email;
    _passwordController.text = widget.authState.password;

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if (!widget.authState.isInitialized) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            child: FormCard(
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  key: _emailKey,
                  autocorrect: false,
                  decoration: InputDecoration(
                      labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) => val.isEmpty || val.trim().length == 0
                      ? 'Please enter your email'
                      : null,
                ),
                TextFormField(
                  controller: _passwordController,
                  key: _passwordKey,
                  autocorrect: false,
                  decoration: InputDecoration(
                      labelText: 'Password'),
                  validator: (val) => val.isEmpty || val.trim().length == 0
                      ? 'Please enter your password'
                      : null,
                  obscureText: true,
                ),
                widget.authState.error == null
                    ? Container()
                    : Container(
                  padding: EdgeInsets.only(top: 26.0, bottom: 4.0),
                  child: Center(
                    child: Text(
                      widget.authState.error,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          RaisedButton(
            child: Text('LOGIN'),
            onPressed: () {
              if (!_formKey.currentState.validate()) {
                return;
              }
              widget.onLoginPressed(
                  context,
                  _emailController.text,
                  _passwordController.text
              );
            },
          ),
        ],
      ),
    );
  }
}

class FormCard extends StatelessWidget {

  FormCard({
    Key key,
    @required this.children,
  }) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: children,
          ),
        ),
      ),
    );
  }
}
