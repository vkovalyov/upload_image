import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:upload_image/src/features/upload_image/domain/bloc/upload_image_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class UploadWidget extends StatefulWidget {
  const UploadWidget({Key? key}) : super(key: key);

  @override
  State<UploadWidget> createState() => _UploadWidgetState();
}

class _UploadWidgetState extends State<UploadWidget> {
  XFile? photo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<UploadImageBloc, UploadImageState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UploadImageInitial) {
            return TextButton(
              onPressed: () async {
                final ImagePicker picker = ImagePicker();
                photo = await picker.pickImage(source: ImageSource.camera);
                if (photo != null) {
                  sendEvent(photo!);
                }
              },
              child: const Text('make screen'),
            );
          } else if (state is UploadInProgress) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          } else if (state is UploadSuccess) {
            return RichText(
                textDirection: TextDirection.ltr,
                text: TextSpan(
                  text: "upload is success",
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                  children: <TextSpan>[
                    const TextSpan(text: " image link : "),
                    TextSpan(
                      text: state.entity.imageLink,
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          final uri = Uri.parse(state.entity.imageLink);
                          _launchInBrowser(uri);
                        },
                    ),
                  ],
                ));
          } else {
            return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Error'),
                  TextButton(
                    onPressed: () {
                      sendEvent(photo!);
                    },
                    child: const Text('retry'),
                  )
                ]);
          }
        },
      ),
    );
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void sendEvent(XFile photo) {
    context.read<UploadImageBloc>().add(SendIMage(photo));
  }
}
