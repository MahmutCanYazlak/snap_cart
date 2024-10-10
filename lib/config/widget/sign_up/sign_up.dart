import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../features/auth/view/login.dart';
import '../../items/app_colors.dart';
import '../../routes/app_route_name.dart';
import '../../utility/enum/image_constants.dart';
import '../custom_text_field/custom_text_field.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  const LoginMethods(
                    labelText: "Google",
                    image: ImageConstants.google,
                  ),
                  SizedBox(
                    width: context.width * 0.05,
                  ),
                  const LoginMethods(
                      labelText: "Facebook", image: ImageConstants.facebook)
                ],
              ),
              CustomTextField(
                  emailController: _emailController, labelText: 'Email'),
              CustomTextField(
                  emailController: _passwordController, labelText: "Password"),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.bottomNavbar);
                },
                child: Container(
                  height: context.height * 0.06,
                  decoration: BoxDecoration(
                    color: AppColors.darkPuple,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Create Account',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
