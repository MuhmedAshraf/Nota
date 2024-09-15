import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notaa/Core/api_helper/dio_consumer.dart';
import 'package:notaa/Feature/01.auth/data/repo/auth_repo_implemet.dart';
import 'package:notaa/Feature/01.auth/presentation/view_models/auth_cubit/user_state.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/page_header.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/page_heading.dart';
import '../../../../../Core/utils/assets.dart';
import '../../view_models/auth_cubit/user_cubit.dart';
import 'custom_form_button.dart';
import 'custom_input_field.dart';
import 'dont_have_an_account.dart';
import 'forget_password_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) =>
          UserCubit(userRepo: AuthRepoImplement(api: DioConsumer(dio: Dio()))),
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const ProfileScreen()));
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                PageHeader(
                  image: AppImages.login,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: context.read<UserCubit>().signInFormKey,
                      child: Column(
                        children: [
                          const PageHeading(title: 'Sign-in'),
                          //!Email
                          CustomInputField(
                            labelText: 'Email',
                            hintText: 'Your email',
                            controller: context.read<UserCubit>().signInEmail,
                          ),
                          const SizedBox(height: 16),
                          //!Password
                          CustomInputField(
                            labelText: 'Password',
                            hintText: 'Your password',
                            obscureText: true,
                            suffixIcon: true,
                            controller:
                                context.read<UserCubit>().signInPassword,
                          ),
                          const SizedBox(height: 16),
                          //! Forget password?
                          ForgetPasswordWidget(size: size),
                          const SizedBox(height: 20),
                          // !Sign In Button
                          state is SignInLoading
                              ? const CircularProgressIndicator()
                              : CustomFormButton(
                                  innerText: 'Sign In',
                                  onPressed: () {
                                    context.read<UserCubit>().signIn();
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
          );
        },
      ),
    );
  }
}
