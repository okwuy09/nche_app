import 'package:share_plus/share_plus.dart';

Future sharePost({required String imageUrl, required String text}) async {
  await Share.shareWithResult(
    '$text, $imageUrl',
    subject: 'Nche',
  );
}
