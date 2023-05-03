import 'package:upload_image/src/core/api/executors/request_executor.dart';
import 'package:upload_image/src/core/api/requests/upload_image.dart';
import 'package:upload_image/src/features/upload_image/data/dto/image_dto.dart';
import 'package:upload_image/src/features/upload_image/domain/entity/image_entity.dart';
import 'package:upload_image/src/features/upload_image/domain/entity/upload_image_entity.dart';
import 'package:upload_image/src/features/upload_image/domain/repositories/upload_repository.dart';

class UploadRepositoryImpl implements UploadRepository {
  final RequestExecutor executor;

  UploadRepositoryImpl(this.executor);

  @override
  Future<ImageEntity> uploadImage(UploadImageEntity entity) async {
    final request = UploadImage(executor: executor, params: entity.toJson());
    final result = await request.exec();
    final imageEntity = result.entity;

    return imageEntity;
  }
}
