import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: GetX<ProfileController>(
          init: controller,
          builder: (controller) {
            final user = controller.user.value; // Access the value property
            if (user != null) {
              return Column(
                children: [
                  Text('Name: ${user.name}'),
                  SizedBox(width: 60),
                  Text('Address: ${user.address}'),
                ],
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 15),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "  My Albums  ",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GetX<ProfileController>(
                init: controller,
                builder: (controller) {
                  final albums = controller.albums;
                  final isLoading = controller.isLoading.value; // Access the value property

                  if (isLoading) {
                    return CircularProgressIndicator();
                  } else if (albums != null && albums.isNotEmpty) {
                    return ListView.builder(
                      itemCount: albums.length,
                      itemBuilder: (context, index) {
                        final album = albums[index];
                        return ListTile(
                          title: Text(album.title),
                          onTap: () {
                            Get.toNamed('/album-details', arguments: {
                              'albumId': album.id,
                              'albumTitle': album.title,
                            });
                          },
                        );
                      },
                    );
                  } else {
                    return Text('No albums available');
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




