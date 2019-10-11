import 'dart:async';
import 'package:build/build.dart';
import 'package:build_filesystem/build_filesystem.dart';

class FSCopyingBuilder implements Builder {
  const FSCopyingBuilder();

  @override
  Map<String, List<String>> get buildExtensions {
    return {
      '.foo': ['.bar']
    };
  }

  @override
  FutureOr<void> build(BuildStep buildStep) async {
    var fs = AssetFileSystem.forBuildStep(buildStep);
    var inputFile = fs.primaryInputFile;
    var outputFile = inputFile.changeExtension('.bar');
    await inputFile.copy(outputFile.path);
  }
}
