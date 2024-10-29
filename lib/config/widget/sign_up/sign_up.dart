// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snap_cart/config/extension/context_extension.dart';
import 'package:snap_cart/core/resources/data_state.dart';

import '../../../features/auth/controller/auth_controller.dart';
import '../../../features/auth/screens/login.dart';
import '../../items/app_colors.dart';
import '../../routes/app_route_name.dart';
import '../../utility/enum/image_constants.dart';
import '../custom_text_field/custom_text_field.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  @override
  void initState() {
    super.initState();
  }

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
                emailController: widget._emailController,
                labelText: 'Name',
              ),
              CustomTextField(
                emailController: widget._passwordController,
                labelText: "Password",
              ),
              InkWell(
                onTap: () async {
                  // Kullanıcı girişini tetikleyelim

                  final authController = ref.read(authControllerProvider);

                  final result = await authController.login(
                    email: widget._emailController.text,
                    password: widget._passwordController.text,
                  );

                  if (result is DataSuccess) {
                    // Başarılı ise ana sayfaya yönlendir
                    Navigator.pushNamed(context, RouteNames.bottomNavbar);
                  } else {
                    // Başarısız ise hata mesajını göster
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(result.message ?? 'Giriş başarısız')),
                    );
                  }
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
