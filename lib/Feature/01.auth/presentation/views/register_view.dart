import 'package:flutter/material.dart';
import 'package:notaa/Core/utils/assets.dart';
import 'package:notaa/Core/utils/colors.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/already_have_an_account_widget.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/custom_form_button.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/custom_input_field.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/page_header.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/page_heading.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffEEF1F3),
      body: Column(
        children: [
          PageHeader(
            image: AppImages.register,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                // key: context.read<UserCubit>().signUpFormKey,
                child: Column(
                  children: [
                    const PageHeading(title: 'Sign-up'),
                    //! Name
                    const CustomInputField(
                      labelText: 'Name',
                      hintText: 'Your name',
                      isDense: true,
                      // controller: context.read<UserCubit>().signUpName,
                    ),
                    const SizedBox(height: 16),
                    //!Email
                    const CustomInputField(
                      labelText: 'Email',
                      hintText: 'Your email',
                      isDense: true,
                      // controller: context.read<UserCubit>().signUpEmail,
                    ),
                    const SizedBox(height: 16),
                    //! Password
                    const CustomInputField(
                      labelText: 'Password',
                      hintText: 'Your password',
                      isDense: true,
                      obscureText: true,
                      suffixIcon: true,
                      // controller: context.read<UserCubit>().signUpPassword,
                    ),
                    const SizedBox(height: 22),
                    //!Sign Up Button
                    // state is SignUpLoading
                    //     ? const CircularProgressIndicator()
                    //     :
                    CustomFormButton(
                      innerText: 'Signup',
                      onPressed: () {
                        // context.read<UserCubit>().signUp();
                      },
                    ),
                    const SizedBox(height: 18),
                    //! Already have an account widget
                    const AlreadyHaveAnAccountWidget(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
