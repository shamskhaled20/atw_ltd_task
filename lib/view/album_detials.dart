import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/album_detials_controller.dart';
import '../model/classes.dart';

class AlbumDetailsScreen extends StatelessWidget {
  final int albumId;
  final String albumTitle;
  AlbumDetailsScreen(this.albumId, this.albumTitle);

  @override
  Widget build(BuildContext context) {
    final AlbumDetailsController controller = Get.put(
      AlbumDetailsController(albumId),
    );
    controller.fetchPhotos();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(albumTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: GetX<AlbumDetailsController>(
                init: controller,
                builder: (controller) {
                  final List<Photo> photos = controller.photos.value;
                  final bool isLoading = controller.isLoading.value;

                  if (isLoading) {
                    return CircularProgressIndicator(); // Show a loading indicator
                  } else if (photos != null && photos.isNotEmpty) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: photos.length,
                      itemBuilder: (context, index) {
                        final photo = photos[index];
                        return Image.network(
                          photo.imageUrl,
                          fit: BoxFit.cover,
                        );
                      },
                    );
                  } else {
                    return Text('No photos available');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
