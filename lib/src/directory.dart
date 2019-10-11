import 'dart:async';
import 'package:build/build.dart';
import 'package:file/file.dart';
import 'package:path/path.dart';
import 'file.dart';
import 'filesystem.dart';
import 'util.dart';

class AssetDirectory extends Directory {
  @override
  final AssetFileSystem fileSystem;

  @override
  final String path;

  AssetDirectory(this.fileSystem, this.path);

  AssetId get assetId => AssetId(fileSystem.package, path);

  Context get context => fileSystem.path;

  @override
  Directory get absolute => AssetDirectory(fileSystem, context.absolute(path));

  @override
  String get basename => context.basename(path);

  @override
  Uri get uri => assetId.uri;

  UnsupportedError _unsupported(String op) => unsupported('Directory', op);

  @override
  Directory childDirectory(String basename) {
    return AssetDirectory(fileSystem, context.join(path, basename));
  }

  @override
  File childFile(String basename) {
    return AssetFile(fileSystem, context.join(path, basename));
  }

  @override
  Link childLink(String basename) => throw _unsupported('symbolic link');

  @override
  Future<Directory> create({bool recursive = false}) {
    // We can't create a directory in the context of a build, BUT
    // we can potentially create files, so just return this directory.
    return Future.value(this);
  }

  @override
  void createSync({bool recursive = false}) => throw asyncOnly();

  @override
  Future<Directory> createTemp([String prefix]) {
    // TODO: implement createTemp
  }

  @override
  Directory createTempSync([String prefix]) => throw asyncOnly();

  @override
  Future<FileSystemEntity> delete({bool recursive = false}) =>
      throw _unsupported('delete');

  @override
  void deleteSync({bool recursive = false}) => throw asyncOnly();

  @override
  String get dirname => context.dirname(path);

  @override
  Future<bool> exists() => Future.value(true);

  @override
  bool existsSync() => throw asyncOnly();

  @override
  bool get isAbsolute => context.isAbsolute(path);

  @override
  Stream<FileSystemEntity> list(
      {bool recursive = false, bool followLinks = true}) {
    // TODO: implement list
  }

  @override
  List<FileSystemEntity> listSync(
          {bool recursive = false, bool followLinks = true}) =>
      throw asyncOnly();

  @override
  Directory get parent => AssetDirectory(fileSystem, context.dirname(path));

  @override
  Future<Directory> rename(String newPath) => throw _unsupported('rename');

  @override
  Directory renameSync(String newPath) => throw asyncOnly();

  @override
  Future<String> resolveSymbolicLinks() => throw _unsupported('symbolic link');

  @override
  String resolveSymbolicLinksSync() => throw asyncOnly();

  @override
  Future<FileStat> stat() {
    // TODO: Stat
  }

  @override
  FileStat statSync() => throw asyncOnly();

  @override
  Stream<FileSystemEvent> watch(
          {int events = FileSystemEvent.all, bool recursive = false}) =>
      throw _unsupported('watch');
}
