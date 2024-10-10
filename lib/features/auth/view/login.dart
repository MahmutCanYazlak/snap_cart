import 'package:flutter/material.dart';
import 'package:snap_cart/config/extension/context_extension.dart';

import '../../../config/items/app_colors.dart';
import '../../../config/utility/constants/string_constants.dart';
import '../../../config/utility/enum/image_constants.dart';
import '../../../config/widget/sign_up/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstants.background.getPng),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.height * 0.1,
              ),
              Text(
                StringConstants.signInTitle,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: context.width,
                  height: context.height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstants.login.getPng),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 0.05,
              ),
              Container(
                width: context.width * 0.85,
                height: context.height * 0.45,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  18, // Opsiyonel olarak yazı boyutunu ayarlayabilirsiniz
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  18, // Opsiyonel olarak yazı boyutunu ayarlayabilirsiniz
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          // SignIn Form
                          // Replace the below Container with your SignIn form widget
                          SignUpView(
                              emailController: _emailController,
                              passwordController: _passwordController),
                          // SignUp Form
                          // Replace the below Container with your SignUp form widget
                          Container(
                            alignment: Alignment.center,
                            child: const Text('SignUp Form'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginMethods extends StatelessWidget {
  const LoginMethods({
    super.key,
    required this.labelText,
    required this.image,
  });

  final String labelText;
  final ImageConstants image;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.lightGrayColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  image.getPng,
                  width: context.width * 0.05,
                  height: context.height * 0.05,
                ),
                Text(
                  labelText,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: AppColors.darkGrayColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
