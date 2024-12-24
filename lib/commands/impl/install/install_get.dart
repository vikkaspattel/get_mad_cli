import '../../../common/utils/pubspec/pubspec_utils.dart';

Future<void> installGet([bool runPubGet = false]) async {
  PubspecUtils.removeDependencies('get_mad', logger: false);
  await PubspecUtils.addDependencies('get_mad', runPubGet: runPubGet);
}
