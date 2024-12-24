import 'dart:io';

/// Create a directory from a list
void createListDirectory(List<Directory> dirs) {
  for (final element in dirs) {
    element.createSync(recursive: true);
  }
}

/// Create a file from a list
void createListFile(List<File> files) {
  for (final element in files) {
    element.createSync(recursive: true);
  }
}
