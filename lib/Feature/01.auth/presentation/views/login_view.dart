import 'package:flutter/material.dart';
import 'package:notaa/Core/utils/assets.dart';
import 'package:notaa/Core/utils/colors.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/custom_form_button.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/custom_input_field.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/forget_password_widget.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/page_header.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/page_heading.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffEEF1F3),
        body: Column(
          children: [
            PageHeader(image: AppImages.login,),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  // key: context.read<UserCubit>().signInFormKey,
                  child: Column(
                    children: [
                      const PageHeading(title: 'Sign-in'),
                      //!Email
                      const CustomInputField(
                        labelText: 'Email',
                        hintText: 'Your email',
                        // controller: context.read<UserCubit>().signInEmail,
                      ),
                      const SizedBox(height: 16),
                      //!Password
                      const CustomInputField(
                        labelText: 'Password',
                        hintText: 'Your password',
                        obscureText: true,
                        suffixIcon: true,
                        // controller: context.read<UserCubit>().signInPassword,
                      ),
                      const SizedBox(height: 16),
                      //! Forget password?
                      ForgetPasswordWidget(size: size),
                      const SizedBox(height: 20),
                      //!Sign In Button
                      // state is SignInLoading
                      //     ? const CircularProgressIndicator()
                      //     :
                      CustomFormButton(
                        innerText: 'Sign In',
                        onPressed: () {
                          // context.read<UserCubit>().signIn();
                        },
                      ),
                      const SizedBox(height: 18),
                      //! Don't Have An Account ?
                      DontHaveAnAccountWidget(size: size),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
