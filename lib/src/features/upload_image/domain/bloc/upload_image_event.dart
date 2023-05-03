part of 'upload_image_bloc.dart';

@immutable
abstract class UploadImageEvent {}

class UploadInit implements UploadImageEvent{}

class SendIMage implements UploadImageEvent{
  final XFile xFile;

  SendIMage(this.xFile);
}