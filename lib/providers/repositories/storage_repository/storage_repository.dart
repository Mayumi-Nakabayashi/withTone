import 'package:firebase_storage/firebase_storage.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class StorageRepository {
  Future<String> saveImage({
    required Asset asset,
    required String path,
  }) async {
    final byteData = await asset.getThumbByteData(
      310,
      150,
      quality: 75,
    );
    final imageData = byteData.buffer.asUint8List();

    final ref = FirebaseStorage.instance.ref().child(path);

    final task = ref.putData(imageData);
    return (await task).ref.getDownloadURL();
  }
}
