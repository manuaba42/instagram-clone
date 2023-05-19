import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // padding
              Flexible(child: Container(), flex: 2,),
              // logo svg
              SvgPicture.asset('assets/ic_instagram.svg', color: primaryColor, height: 64,),
              const SizedBox(height: 64,),
              // text input
              TextFieldInput(textEditingController: _emailController, hintText: 'Enter Your Email', textInputType: TextInputType.emailAddress),
              const SizedBox(height: 24,),

              TextFieldInput(textEditingController: _passwordController, hintText: 'Enter Your Password', textInputType: TextInputType.text, isPass: true,),
              const SizedBox(height: 24,),

              // button
              Container(
                child: const Text('Log in'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                  color: blueColor,
                  ),
              ),
              const SizedBox(height: 12,),
              Flexible(child: Container(), flex: 2,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an account?"),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8
                    ),
                  ),
                  Container(
                    child: const Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold),),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8
                    ),
                  )
                ],
              )


            ]),
        ) 
        ),
    );
  }
}
