import 'dart:async';
import 'package:build/build.dart';
import 'package:file/file.dart';
import 'package:path/path.dart';
import 'package:scratch_space/scratch_space.dart';
import 'directory.dart';
import 'file.dart';
import 'stat.dart';
import 'util.dart';

class AssetFileSystem extends FileSystem {
  final String package;
  final AssetReader reader;
  final AssetWriter writer;
  final BuildStep buildStep;

  Context _path = Context(current: '');
  ScratchSpace _scratchSpace;

  AssetFileSystem(this.package, this.reader, this.writer, {this.buildStep});

  factory AssetFileSystem.forBuildStep(BuildStep buildStep) {
    var asset = buildStep.inputId;
    return AssetFileSystem(asset.package, buildStep, buildStep,
        buildStep: buildStep)
      ..currentDirectory = dirname(asset.path);
  }

  Context get path => _path;

  @override
  Directory get currentDirectory => directory(path.current);

  @override
  set currentDirectory(dynamic path) {
    assert(path is String || path is Directory);
    _path = Context(current: path is Directory ? path.path : path.toString());
  }

  ScratchSpace get scratchSpace => _scratchSpace ??= ScratchSpace();

  UnsupportedError _unsupported(String op) => unsupported('FileSystem', op);

  AssetFile get primaryInputFile {
    if (buildStep == null) {
      throw StateError(
          'This `AssetFileSystem` is not associated with a `BuildStep`.');
    }
    return file(buildStep.inputId);
  }

  Future close() => Future.sync(() => _scratchSpace?.delete());

  String toPath(path) {
    // TODO: Implement
  }

  @override
  AssetDirectory directory(path) {
    return AssetDirectory(this, toPath(path));
  }

  @override
  AssetFile file(path) {
    return AssetFile(this, toPath(path));
  }

  @override
  Future<bool> identical(String path1, String path2) =>
      Future<bool>.value(identicalSync(path1, path2));

  @override
  bool identicalSync(String path1, String path2) {
    return path.equals(path1, path2);
  }

  @override
  bool get isWatchSupported => false;

  @override
  Link link(path) => throw _unsupported('symbolic link');

  @override
  Future<FileStat> stat(String path) {
    // TODO: implement stat
  }

  @override
  FileStat statSync(String path) => throw asyncOnly();

  // TODO: implement systemTempDirectory
  @override
  Directory get systemTempDirectory => null;

  @override
  Future<FileSystemEntityType> type(String path, {bool followLinks = true}) {
    // TODO: implement type
  }

  @override
  FileSystemEntityType typeSync(String path, {bool followLinks = true}) {
    throw asyncOnly();
  }
}
