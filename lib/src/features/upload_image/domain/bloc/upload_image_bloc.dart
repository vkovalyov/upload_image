import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_image/src/features/upload_image/domain/entity/image_entity.dart';
import 'package:upload_image/src/features/upload_image/domain/entity/upload_image_entity.dart';
import 'package:upload_image/src/features/upload_image/domain/repositories/upload_repository.dart';

part 'upload_image_event.dart';

part 'upload_image_state.dart';

class UploadImageBloc extends Bloc<UploadImageEvent, UploadImageState> {
  final UploadRepository repository;

  UploadImageBloc(this.repository) : super(UploadImageInitial()) {
    on<UploadInit>((event, emit) {
      emit(UploadImageInitial());
    });

    on<SendIMage>((event, emit) async {
      emit(UploadInProgress());
      try {
        Uint8List imageBytes = await event.xFile.readAsBytes();
        String base64string = base64.encode(imageBytes);
        final entity = UploadImageEntity(base64string);
        final result = await repository.uploadImage(entity);
        emit(UploadSuccess(result));
      } catch (e) {
        emit(UploadError());
      }
    });
  }
}
