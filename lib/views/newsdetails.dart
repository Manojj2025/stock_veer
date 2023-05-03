import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:stock_veer/utils/values.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../utils/colors.dart';

class NewsDetails extends StatelessWidget {
  Map data;
  final String name;
  NewsDetails({super.key, required this.data, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kNavyBlue,
        title: Text(
          name,
          style: BaseStyles.whitebold14,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            imageBuilder: (context, imageProvider) => Container(
              // height: 60.0,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            imageUrl: data['image'].toString(),
            height: 200,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.contain,
            placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(
              color: AppColors.blackColor,
            )),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data['symbol'].toString(),
                  style: BaseStyles.grey1Medium14,
                  // maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                heightSpace3,
                Text(
                  data['title'].toString(),
                  style: BaseStyles.blackMedium14,
                  // maxLines: 2,
                  // overflow: TextOverflow.ellipsis,
                ),
                heightSpace5,
                Text(
                  data['publishedDate'].toString().substring(0, 10),
                  style: BaseStyles.grey3Normal10,
                ),
                heightSpace5,
                Text(
                  data['text'].toString(),
                  style: BaseStyles.blacNormal14,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
