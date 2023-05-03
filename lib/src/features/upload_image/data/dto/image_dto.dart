import 'package:upload_image/src/features/upload_image/domain/entity/image_entity.dart';

class ImageDto {
  Data? data;
  bool? success;
  int? status;

  ImageDto({this.data, this.success, this.status});

  ImageDto.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    success = json['success'];
    status = json['status'];
  }
}

class Data {
  String? id;
  String? title;
  String? urlViewer;
  String? url;
  String? displayUrl;
  int? width;
  int? height;
  int? size;
  int? time;
  int? expiration;
  Image? image;
  Image? thumb;
  Image? medium;
  String? deleteUrl;

  Data(
      {this.id,
      this.title,
      this.urlViewer,
      this.url,
      this.displayUrl,
      this.width,
      this.height,
      this.size,
      this.time,
      this.expiration,
      this.image,
      this.thumb,
      this.medium,
      this.deleteUrl});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    urlViewer = json['url_viewer'];
    url = json['url'];
    displayUrl = json['display_url'];
    width = json['width'];
    height = json['height'];
    size = json['size'];
    time = json['time'];
    expiration = json['expiration'];
    image = json['image'] != null ? Image.fromJson(json['image']) : null;
    thumb = json['thumb'] != null ? Image.fromJson(json['thumb']) : null;
    medium = json['medium'] != null ? Image.fromJson(json['medium']) : null;
    deleteUrl = json['delete_url'];
  }
}

class Image {
  String? filename;
  String? name;
  String? mime;
  String? extension;
  String? url;

  Image({this.filename, this.name, this.mime, this.extension, this.url});

  Image.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    name = json['name'];
    mime = json['mime'];
    extension = json['extension'];
    url = json['url'];
  }
}

extension ImageDtoExt on ImageDto {
  ImageEntity get entity {
    return ImageEntity(data?.image?.url ?? '');
  }
}
