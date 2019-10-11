import 'dart:async';

import 'package:build/build.dart';
import 'package:file/file.dart';
import 'package:path/path.dart';
import 'package:scratch_space/scratch_space.dart';
import 'directory.dart';
import 'file.dart';
import 'link.dart';
import 'stat.dart';
import 'util.dart';

class AssetFileSystem extends FileSystem {
  final String package;
  final AssetReader reader;
  final AssetWriter writer;

  Context _path = Context(current: '');
  ScratchSpace _scratchSpace;

  AssetFileSystem(this.package, this.reader, this.writer);

  factory AssetFileSystem.forBuildStep(BuildStep buildStep) {
    var asset = buildStep.inputId;
    return AssetFileSystem(asset.package, buildStep, buildStep)
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

  Future close() => Future.sync(() => _scratchSpace?.delete());

  String toPath(path) {
    // TODO: Implement
  }

  @override
  Directory directory(path) {
    return AssetDirectory(this, toPath(path));
  }

  @override
  File file(path) {
    // TODO: implement file
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
  Link link(path) {
    // TODO: implement link
  }

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
