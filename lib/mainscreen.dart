import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:recipe_app/view/homescreen.dart';
import 'package:recipe_app/view/login_screen.dart';
import 'package:recipe_app/view/new_password_screen.dart';
import 'package:recipe_app/view/sign_up_screen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int currentIndex = 0;
  late final List<Widget> page;
  @override
  void initState() {
    page = [LoginScreen(), SignUpScreen(), NewPasswordScreen(), Homescreen()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        iconSize: 35.r,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,

        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Iconsax.login), label: "Login"),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.login_15),
            label: "Signup",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.password_check),
            label: "Password",
          ),
          BottomNavigationBarItem(icon: Icon(Iconsax.home), label: "Home"),
        ],
      ),
      body: page[currentIndex],
    );
  }
}
