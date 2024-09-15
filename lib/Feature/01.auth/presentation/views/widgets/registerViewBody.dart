import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notaa/Core/api_helper/dio_consumer.dart';
import 'package:notaa/Feature/01.auth/data/repo/auth_repo_implemet.dart';
import 'package:notaa/Feature/01.auth/presentation/view_models/auth_cubit/user_cubit.dart';
import 'package:notaa/Feature/01.auth/presentation/view_models/auth_cubit/user_state.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/page_header.dart';
import 'package:notaa/Feature/01.auth/presentation/views/widgets/page_heading.dart';
import '../../../../../Core/utils/assets.dart';
import 'already_have_an_account_widget.dart';
import 'custom_form_button.dart';
import 'custom_input_field.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                          CustomInputField(
                            labelText: 'Name',
                            hintText: 'Your name',
                            isDense: true,
                            controller: context.read<UserCubit>().signUpName,
                          ),
                          const SizedBox(height: 16),
                          //!Email
                          CustomInputField(
                            labelText: 'Email',
                            hintText: 'Your email',
                            isDense: true,
                            controller: context.read<UserCubit>().signUpEmail,
                          ),
                          const SizedBox(height: 16),
                          //! Password
                          CustomInputField(
                            labelText: 'Password',
                            hintText: 'Your password',
                            isDense: true,
                            obscureText: true,
                            suffixIcon: true,
                            controller:
                                context.read<UserCubit>().signUpPassword,
                          ),
                          const SizedBox(height: 22),
                          //!Sign Up Button
                          state is SignUpLoading
                              ? const CircularProgressIndicator()
                              : CustomFormButton(
                                  innerText: 'Signup',
                                  onPressed: () {
                                    context.read<UserCubit>().signUp();
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
          );
        },
      ),
    );
  }
}
