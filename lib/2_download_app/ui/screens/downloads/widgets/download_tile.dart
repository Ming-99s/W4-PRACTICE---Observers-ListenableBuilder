import 'package:flutter/material.dart';

import 'download_controler.dart';

class DownloadTile extends StatelessWidget {
  const DownloadTile({
    super.key,
    required this.controller,
    required this.onTap,
  });

  final DownloadController controller;
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

  String? _buildSubtitle() {
    final percentage = controller.progress * 100;
    switch (controller.status) {
      case DownloadStatus.notDownloaded:
        return null;

      case DownloadStatus.downloading:
        final downloaded = (controller.ressource.size * controller.progress)
            .toStringAsFixed(0);
        
        return "${percentage.toStringAsFixed(0)}% - $downloaded of ${controller.ressource.size} MB";

      case DownloadStatus.downloaded:
        return "${percentage.toStringAsFixed(0)}% - Completed of ${controller.ressource.size} MB";
    }
  }

  // TODO

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, _) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListTile(
              title: Text(controller.ressource.name),
              trailing: Icon(_buildIcon()),
              subtitle: _buildSubtitle() != null
                  ? Text(_buildSubtitle()!)
                  : null,
            ),
          ),
        );
      },
    );

    // TODO
  }
}
