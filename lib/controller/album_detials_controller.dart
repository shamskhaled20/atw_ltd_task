import 'package:get/get.dart';
import '../model/backend_side.dart';
import '../model/classes.dart';

class AlbumDetailsController extends GetxController {
  final int albumId;
  final RxList<Photo> photos = <Photo>[].obs;
  final RxBool isLoading = true.obs;

  AlbumDetailsController(this.albumId);

  @override
  void onInit() {
    super.onInit();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    try {
      // Fetch photos data for the albumId
      final List<Photo> fetchedPhotos = await ApiService.getPhotos(albumId);
      photos.value = fetchedPhotos;
    } catch (e) {
      // Handle error
      print('Error fetching photos data: $e');
    } finally {
      isLoading.value = false; // Set isLoading to false once data is fetched
    }
  }
}
