import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ImageLoader extends StatelessWidget {
  final String imageUrl;
  final double imageSize;
  final String imageError;

  ImageLoader({Key key, this.imageUrl, this.imageSize, this.imageError})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty
        ? imageError != null
            ? Image.asset(
                imageError,
                width: imageSize,
              )
            : Icon(
                Icons.error,
                size: imageSize,
              )
        : imageUrl.contains('http')
            ? CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: imageSize,
                    width: imageSize,
                  ),
                ),
                imageBuilder: (context, imageProvider) => Container(
                  width: imageSize,
                  height: imageSize,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => imageError != null
                    ? Image.asset(
                        imageError,
                        width: imageSize,
                      )
                    : Icon(
                        Icons.error,
                        size: imageSize,
                      ),
              )
            : Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: FileImage(File(this.imageUrl)),
                    fit: BoxFit.cover,
                  ),
                ),
              );
  }
}
