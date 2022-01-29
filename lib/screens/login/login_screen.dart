import 'package:biotapajos_audio/common/color.dart';
import 'package:biotapajos_audio/common/error_box.dart';
import 'package:biotapajos_audio/screens/base/base_screen.dart';
import 'package:biotapajos_audio/store/login_store.dart';
import 'package:biotapajos_audio/store/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final LoginStore loginStore = LoginStore();

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  void initState() {
    super.initState();

    when((_) => userManagerStore.user != null, () {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => BaseScreen()),
              (Route<dynamic> route) => false,);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 80, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/images/logo.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Login",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: PRIMARY,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, right: 10),
                child: Observer(builder: (_){
                  return TextFormField(
                    enabled: !loginStore.loading,
                    onChanged: loginStore.setEmail,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      errorText: loginStore.emailError,
                      labelText: "Email",
                      icon: Icon(Icons.email, color: PRIMARY,),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10),
                child: Observer(builder: (_){
                  return TextFormField(
                    enabled: !loginStore.loading,
                    onChanged: loginStore.setPassword,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      errorText: loginStore.passwordError,
                      labelText: "Senha",
                      icon: Icon(Icons.lock, color: PRIMARY,),
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    style: TextStyle(fontSize: 16),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(PRIMARY),
                      ),
                      onPressed: loginStore.recoverPassword,
                      child: Text('Esqueceu sua senha?'),
                    ),
                  ),
                ],
              ),
              Observer(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ErrorBox(message: loginStore.error),
                );
              }),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Observer(builder: (_){
                  return SizedBox(
                    height: 54,
                    child: ElevatedButton(
                        onPressed: loginStore.loginPressed,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          primary: PRIMARY,
                          onSurface: PRIMARY,
                        ),
                        child: Text('ENTRAR')
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
