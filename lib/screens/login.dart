import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // appBar, body, 등등 포함하고 있다
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Expanded( //남은 영역 다 쓰기
                child: Padding(
                  padding: EdgeInsets.only(top: 40,left: 24, right: 24),
                  child: FittedBox( //이미지가 세로 길이만 늘어나서 FittedBox로 감싸준다
                    fit: BoxFit.contain, //자세한건 검색할 것
                    child: CircleAvatar( // 이미지 동그랗게
                      backgroundImage:
                          NetworkImage("https://i.gifer.com/w8y.gif"),
                    ),
                  ),
                ),
              ),
              Stack(
                children: <Widget>[
                  _inputForm(size),
                  _authButton(size),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ),
              const Text("Don`t Have an Account? Create One"),
              Container(
                height: size.height * 0.05,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _authButton(Size size) {
    return Positioned(
        left: size.width * 0.15,
        right: size.width * 0.15,
        bottom: 0,
        child: RaisedButton(
          color: Colors.black,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: const Text(
            "Login",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ));
  }

  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 12, top: 12, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: "Email",
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Please input correct Email.";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: "Password",
                    ),
                    validator: (value) {
                      if (value == null) {
                        return "Please input correct Password.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
                  ),
                  const Text("Forget Password"),
                ],
              )),
        ),
      ),
    );
  }
}
