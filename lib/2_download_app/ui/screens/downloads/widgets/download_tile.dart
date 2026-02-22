import 'package:flutter/material.dart';
import 'package:week4/2_download_app/ui/theme/theme.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({
    super.key,
    required this.controller,
    required this.title,
    required this.size,
    required this.onTap
  });

  final DownloadController controller;
  final String title;
  final int size;
  final Function() onTap;

  IconData _buildIcon() {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return Icons.download;

      case DownloadStatus.downloading:
        return Icons.downloading;

      case DownloadStatus.downloaded:
        return Icons.folder;
    }
  }

  String _buildSubtitle() {
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return "$size MB";

      case DownloadStatus.downloading:
        final downloaded = (size * controller.progress).toStringAsFixed(0);
        return "$downloaded of $size MB";

      case DownloadStatus.downloaded:
        return "Completed of $size MB";
    }
  }

  // TODO

 @override
Widget build(BuildContext context) {
  return AnimatedBuilder(
    animation: controller,
    builder: (context, _) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.greyLight,
          ),
          child: ListTile(
            title: Text(title),
            trailing: Icon(_buildIcon()),
            subtitle: Text(
              '${(controller.progress * 100).toStringAsFixed(0)}% - ${_buildSubtitle()}',
            ),
          ),
        ),
      );
    },
  );

    // TODO
  }
}
