import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:redit_flutter_news/constant/app_colors.dart';
import 'package:redit_flutter_news/constant/links.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String thumbnail;
  final int index;
  const CardWidget({
    Key? key,
    required this.title,
    required this.thumbnail,
    required this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: AppColors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 16),
      height: 150,
      child: ListTile(
        title: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 70,
            width: 70,
            child: CachedNetworkImage(
              imageUrl: thumbnail,
              fit: BoxFit.fill,
              placeholder: (context, url) {
                return const Center(child: LinearProgressIndicator());
              },
              errorWidget: (context, url, error) => Image.network(
                noImage,
              ),
            ),
          ),
        ),
        trailing: Text(
          index.toString(),
        ),
      ),
    );
  }
}
