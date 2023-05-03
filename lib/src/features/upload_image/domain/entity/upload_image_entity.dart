class UploadImageEntity {
  final String key = 'bacb9b5ab1e85f0c80376c945dcfa010';
  final String base64Image;

  UploadImageEntity(this.base64Image);

  Map<String, dynamic> toJson() {
    return {'key': key, 'image': base64Image};
  }
}
