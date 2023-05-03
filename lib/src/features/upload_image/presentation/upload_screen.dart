import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upload_image/src/core/di/repository_injection_container.dart';
import 'package:upload_image/src/features/upload_image/domain/bloc/upload_image_bloc.dart';
import 'package:upload_image/src/features/upload_image/domain/repositories/upload_repository.dart';
import 'package:upload_image/src/features/upload_image/presentation/upload_widget.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: BlocProvider<UploadImageBloc>(
        create: (_) {
          final bloc = UploadImageBloc(slRepository<UploadRepository>());

          return bloc;
        },
        child: const UploadWidget(),
      ),
    ));
  }
}
