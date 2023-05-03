import 'package:upload_image/src/features/upload_image/domain/entity/image_entity.dart';
import 'package:upload_image/src/features/upload_image/domain/entity/upload_image_entity.dart';

abstract class UploadRepository {
  Future<ImageEntity> uploadImage(UploadImageEntity entity);
}
