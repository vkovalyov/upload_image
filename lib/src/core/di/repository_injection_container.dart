import 'package:get_it/get_it.dart';
import 'package:upload_image/src/core/api/executors/api_post_executor.dart';
import 'package:upload_image/src/core/di/executor_injection_container.dart';
import 'package:upload_image/src/features/upload_image/data/repositories/upload_repository.dart';
import 'package:upload_image/src/features/upload_image/domain/repositories/upload_repository.dart';

final slRepository = GetIt.instance;

Future<void> init() async {
  slRepository.registerLazySingleton<UploadRepository>(
      () => UploadRepositoryImpl(slExecutor<ApiPostExecutor>()));
}
