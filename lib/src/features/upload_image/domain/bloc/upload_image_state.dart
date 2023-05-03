part of 'upload_image_bloc.dart';

@immutable
abstract class UploadImageState {}

class UploadImageInitial extends UploadImageState {}

class UploadInProgress implements UploadImageState {}

class UploadSuccess implements UploadImageState {
  final ImageEntity entity;

  UploadSuccess(this.entity);
}

class UploadError implements UploadImageState {}
