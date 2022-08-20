import 'package:flutter/material.dart';

class join extends StatelessWidget{
  const join({Key? key}) : super(key: key);

  Widget _avatar(){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset('assets/noProfile.png', fit:BoxFit.cover),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('회원가입'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            _avatar(),
          ]
        )
      ),
    );
  }
}