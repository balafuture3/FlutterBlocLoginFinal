import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginwithbloc/auth/auth_repository.dart';
import 'package:loginwithbloc/auth/form_submission_status.dart';
import 'package:loginwithbloc/auth/login/login_bloc.dart';
import 'package:loginwithbloc/auth/login/login_event.dart';
import 'package:loginwithbloc/auth/login/login_state.dart';
import 'package:loginwithbloc/dashboard/dash_repository.dart';
import 'package:loginwithbloc/dashboard/dashboard_screen.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var UsernameController= TextEditingController();
  var PasswordController= TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => LoginBloc(context.read<AuthRepository>()),//..add(LoginSubmitted(username: "username", password: "password")),
      child: _loginForm(),
    ));
  }

  Widget _loginForm() {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        final formStatus = state.formstatus;
        if (formStatus is SubmitSuccess) {
          Navigator.push(context, MaterialPageRoute(builder: (builder)=>RepositoryProvider(
              create: (context) => DashRepository(), child: Dashboard(id:state.id,))));
        }
       else if (formStatus is SubmitFailed) {
          showsnackBar(context, formStatus.exception.toString());
        }
        // TODO: implement listener
      },
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [_usernameField(), _passwordField(), _loginButton()],
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: PasswordController,
          obscureText: true,


          decoration: const InputDecoration(
            // errorText:  !state.isValidPass ?"Password is too short":null,
              hintText: "Password", icon: Icon(Icons.security)),
          validator: (value) =>
              state.isValidPass ? null : "Password is too short",


          onChanged: (value) {
            context
                .read<LoginBloc>()
                .add(LoginPasswordChanged(password: value));
          },
        );
      },
    );
  }

  Widget _usernameField() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          controller: UsernameController,
          decoration: const InputDecoration(
            // errorText: state.isValidUsername?null : "Username is too short",
              hintText: "Username", icon: Icon(Icons.person)),
          validator: (value) =>
              state.isValidUsername ? null : "Username is too short",
          onChanged: (value) {
            context
                .read<LoginBloc>()
                .add(LoginUsernameChanged(username: value));
          },
        );
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return state.formstatus is FormSubmitting
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () {
                  print(_formKey.currentState!.validate());
                  print(state.formstatus);
                  print(state.username);
                  print(state.password);

                  print(_formKey.currentState!.validate());
                  if (_formKey.currentState!.validate()) {
                    context.read<LoginBloc>().add(LoginSubmitted(username: UsernameController.text,password: PasswordController.text));
                  }
                },
                child: const Text("Login"));
      },
    );
  }

  void showsnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
