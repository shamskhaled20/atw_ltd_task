import 'package:get/get.dart';
import '../model/backend_side.dart';
import '../model/classes.dart';

class ProfileController extends GetxController {
  Rx<User?> user = Rx<User?>(null);
  RxList<Album> albums = RxList<Album>([]);
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;

      final fetchedUser = await ApiService.getUser();
      user.value = fetchedUser;
      await fetchAlbumsData(fetchedUser?.id);

      isLoading.value = false;
    } catch (e) {
      print('Error fetching user and albums data: $e');
      isLoading.value = false;
    }
  }

  Future<void> fetchAlbumsData(int? userId) async {
    try {
      if (userId != null) {
        final fetchedAlbums = await ApiService.getAlbums(userId);
        albums.assignAll(fetchedAlbums);
      }
    } catch (e) {
      print('Error fetching albums data: $e');
    }
  }
}
