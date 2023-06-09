import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>
    with SingleTickerProviderStateMixin {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

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
    _bioController.dispose();
    _usernameController.dispose();
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
              // circular widget
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=1060&t=st=1684471965~exp=1684472565~hmac=dba0e13946fa6e790989a5827a0c33706e06440e252e4e271820cc1243e90cfa'
                    ),
                  ),
                  Positioned(bottom: -10, left: 80, child: IconButton(onPressed: () {}, icon: const Icon(Icons.add_a_photo),))
                ],
              ),
              const SizedBox(height: 24,),
              // text input
              TextFieldInput(textEditingController: _usernameController, hintText: 'Enter Your Username', textInputType: TextInputType.text),
              const SizedBox(height: 24,),

              TextFieldInput(textEditingController: _emailController, hintText: 'Enter Your Email', textInputType: TextInputType.emailAddress),
              const SizedBox(height: 24,),

              TextFieldInput(textEditingController: _passwordController, hintText: 'Enter Your Password', textInputType: TextInputType.text, isPass: true,),
              const SizedBox(height: 24,),

              TextFieldInput(textEditingController: _bioController, hintText: 'Enter Your Bio', textInputType: TextInputType.text),
              const SizedBox(height: 24,),

              // button
              InkWell(
                onTap: () {},
                child: Container(
                  child: const Text('Log in'),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                    color: blueColor,
                    ),
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
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      child: const Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold),),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8
                      ),
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
