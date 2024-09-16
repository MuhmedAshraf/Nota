import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notaa/Core/api_helper/dio_consumer.dart';
import 'package:notaa/Core/shared_widgets/custom_error_widget.dart';
import 'package:notaa/Core/shared_widgets/custom_loading.dart';
import 'package:notaa/Feature/02.Home/data/repo/note_repo_implement.dart';
import 'package:notaa/Feature/02.Home/presentation/view_model/note_cubit/note_cubit.dart';
import 'package:notaa/Feature/02.Home/presentation/view_model/note_cubit/note_state.dart';
import 'package:notaa/Feature/02.Home/presentation/views/widgets/noNotes_body.dart';
import 'note_item.dart';

class ListNotesBody extends StatelessWidget {
  const ListNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NoteCubit(repo: NoteRepoImplement(api: DioConsumer(dio: Dio())))..getNotes(),
      child: BlocBuilder<NoteCubit, NoteState>(
        builder: (context, state) {
          if (state is NoteSuccess) {
            return ListView.builder(
              itemBuilder: (context, i) => NoteItem(
                note: state.notes[i],
              ),
              itemCount: state.notes.length,
              physics: const BouncingScrollPhysics(),
            );
          } else if (state is NoteFailure) {
            return CustomErrorWidget(errorText: state.errMessage);
          } else if (state is NoteLoading) {
            return const CustomLoading();
          } else {
            return const NoNotesBody();
          }
        },
      ),
    );
  }
}
