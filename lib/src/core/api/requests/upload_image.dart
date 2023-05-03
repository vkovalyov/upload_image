import 'package:upload_image/src/core/api/requests/api_request.dart';
import 'package:upload_image/src/features/upload_image/data/dto/image_dto.dart';

class UploadImage extends ApiRequest<ImageDto> {
  UploadImage({required super.executor, required super.params});

  @override
  ImageDto convertJson(Map<String, dynamic> data) {
    return ImageDto.fromJson(data);
  }
}
