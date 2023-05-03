import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:upload_image/src/features/upload_image/domain/bloc/upload_image_bloc.dart';
import 'package:upload_image/src/features/upload_image/domain/entity/image_entity.dart';
import 'package:upload_image/src/features/upload_image/domain/entity/upload_image_entity.dart';
import 'package:upload_image/src/features/upload_image/domain/repositories/upload_repository.dart';

class MockUploadRepository extends Mock implements UploadRepository {}

void main() {
  late UploadImageBloc uploadImageBloc;
  late UploadRepository uploadRepository;

  setUpAll(() {
    registerFallbackValue(UploadImageEntity(''));
  });

  group('tests UploadImageBloc', () {
    setUp(() async {
      uploadRepository = MockUploadRepository();
      uploadImageBloc = UploadImageBloc(uploadRepository);
    });

    test('initial state', () {
      expect(uploadImageBloc.state, isA<UploadImageInitial>());
    });

    blocTest<UploadImageBloc, UploadImageState>(
      'event  UploadInit'
      'emit [UploadImageInitial]',
      build: () {
        return uploadImageBloc;
      },
      wait: const Duration(milliseconds: 1000),
      act: (bloc) => bloc.add(UploadInit()),
      expect: () => [isA<UploadImageInitial>()],
    );
  });
}
