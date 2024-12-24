import 'dart:io';

import '../../../../common/utils/logger/log_utils.dart';
import '../../../../common/utils/pubspec/pubspec_utils.dart';
import '../../../../core/internationalization.dart';
import '../../../../core/locales.g.dart';
import '../../../../core/structure.dart';
import '../../../../functions/create/create_list_directory.dart';
import '../../../../functions/create/create_main.dart';
import '../../../../samples/impl/getx_pattern/get_main.dart';
import '../../commads_export.dart';
import '../../install/install_get.dart';

Future<void> createInitGetxPattern() async {
  var canContinue = await createMain();
  if (!canContinue) return;

  var isServerProject = PubspecUtils.isServerProject;
  if (!isServerProject) {
    await installGet();
  }
  var initialDirs = [
    Directory(Structure.replaceAsExpected(path: 'lib/app/data/')),
    Directory(Structure.replaceAsExpected(path: 'lib/app/utils/extensions/')),
  ];

  var initialFiles = [
    File(Structure.replaceAsExpected(path: 'lib/app/utils/extensions.dart')),
    File(Structure.replaceAsExpected(path: 'lib/app/utils/extensions/get_interface.dart')),
  ];

  GetXMainSample(isServer: isServerProject).create();
  await Future.wait([
    CreatePageCommand().execute(),
  ]);
  createListDirectory(initialDirs);
  createListFile(initialFiles);

  var extension = File(Structure.replaceAsExpected(path: 'lib/app/utils/extensions.dart'));

  final extensionCode = '''
import 'package:get_mad/get.dart';

import '../routes/app_pages.dart';

part 'extensions/get_interface.dart';
  ''';

  await extension.writeAsString(extensionCode, mode: FileMode.write);

  var getInterfaceExtension = File(Structure.replaceAsExpected(path: 'lib/app/utils/extensions/get_interface.dart'));
  var getInterfaceCode = '''
part of '../extensions.dart';

extension UniqueRoute on GetInterface {
  Future<T?>? toNamedUnique<T>(String name, {dynamic arguments, String? uniqueTag}) {
    final page = AppPages.routes.firstWhere((element) => element.name == name);
    final getView = page.page() as GetView;
    uniqueTag ??= DateTime.now().millisecondsSinceEpoch.toString();
    return Get.to<T>(
      () => getView..tagValue = uniqueTag,
      arguments: arguments,
      binding: page.binding?..tagValue = uniqueTag,
      preventDuplicates: false,
      routeName: name,
    );
  }
}
''';
  await getInterfaceExtension.writeAsString(getInterfaceCode, mode: FileMode.write);

  LogService.success(Translation(LocaleKeys.sucess_getx_pattern_generated));
}
