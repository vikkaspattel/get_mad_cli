import 'dart:io';

void main() {
  final directory = Directory('lib/app/utils/extensions');
  if (!directory.existsSync()) {
    directory.createSync(recursive: true);
  }
  
  final file = File('lib/app/utils/extensions/extensions.dart');
  if (!file.existsSync()) {
    file.createSync();
  }


  final getInterfaceFile = File('lib/app/utils/extensions/get_interface.dart');
  if (!getInterfaceFile.existsSync()) {
    getInterfaceFile.createSync();
  }
}