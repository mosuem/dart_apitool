import 'dart:io';

import 'package:dart_apitool/api_tool.dart';

import '../package_ref.dart';

mixin CommandMixin {
  final packageRefExplanation = '''
Package reference can be one of:
- directory path pointing to a package on disk (e.g. /path/to/package)
- a diff file generated by dart_apitool (e.g. packageApi.json)
- any package from pub (e.g. pub://package_name/version)
''';

  Future prepare(PackageRef ref) async {
    if (ref.isPackageApiFile || ref.isDirectoryPath) {
      return;
    }
    if (ref.isPubRef) {
      print('Downloading ${ref.pubPackage!}:${ref.pubVersion!}');
      await PubInteraction.installPackageToCache(
          ref.pubPackage!, ref.pubVersion!);
      return;
    }
    throw ArgumentError('Unknown package ref: ${ref.ref}');
  }

  Future<PackageApi> analyze(PackageRef ref) async {
    if (ref.isPackageApiFile) {
      final fileContent = await File(ref.ref).readAsString();
      return PackageApiStorage.packageApiFromStorageJson(fileContent);
    }
    String? path;
    if (ref.isDirectoryPath) {
      path = ref.ref;
    }
    if (ref.isPubRef) {
      path = PubInteraction.getPackagePathInCache(
          ref.pubPackage!, ref.pubVersion!);
    }
    if (path == null) {
      throw ArgumentError('Don\'t know how to handle ${ref.ref}');
    }
    print('Analyzing $path');
    final analyzer = PackageApiAnalyzer(packagePath: path);
    return await analyzer.analyze();
  }
}
