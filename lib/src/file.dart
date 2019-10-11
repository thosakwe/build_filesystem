import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;
import 'package:build/build.dart';
import 'package:file/file.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as p;
import 'package:path/path.dart';
import 'directory.dart';
import 'filesystem.dart';
import 'util.dart';

class AssetFile extends File {
  @override
  final AssetFileSystem fileSystem;

  @override
  final String path;

  AssetFile(this.fileSystem, this.path);

  AssetId get assetId => AssetId(fileSystem.package, path);

  Context get context => fileSystem.path;

  @override
  File get absolute => AssetFile(fileSystem, context.absolute(path));

  @override
  String get basename => context.basename(path);

  UnsupportedError _unsupported(String op) => unsupported('Directory', op);

  @override
  Future<File> copy(String newPath) {
    // TODO: implement copy
    return null;
  }

  File changeExtension(String newExtension) {
    return AssetFile(fileSystem, context.setExtension(path, newExtension));
  }

  @override
  File copySync(String newPath) => throw asyncOnly();

  @override
  Future<File> create({bool recursive = false}) => Future.value(this);

  @override
  void createSync({bool recursive = false}) => throw asyncOnly();

  @override
  Future<FileSystemEntity> delete({bool recursive = false}) =>
      throw _unsupported('deletion');

  @override
  void deleteSync({bool recursive = false}) => throw asyncOnly();

  @override
  String get dirname => context.dirname(path);

  @override
  Future<bool> exists() => fileSystem.reader.canRead(assetId);

  @override
  bool existsSync() => throw asyncOnly();

  @override
  bool get isAbsolute => context.isAbsolute(path);

  @override
  Future<DateTime> lastAccessed() async => DateTime.now();

  @override
  DateTime lastAccessedSync() => throw asyncOnly();

  @override
  Future<DateTime> lastModified() async => DateTime.now();

  @override
  DateTime lastModifiedSync() => throw asyncOnly();

  @override
  Future<int> length() => readAsBytes().then((buf) => buf.length);

  @override
  int lengthSync() => throw asyncOnly();

  @override
  Future<RandomAccessFile> open({FileMode mode = FileMode.read}) =>
      throw _unsupported('random access file');

  @override
  Stream<List<int>> openRead([int start, int end]) {
    var ctrl = StreamController<List<int>>();
    readAsBytes().then((buf) {
      start ??= 0;
      end ??= buf.length;
      ctrl.add(buf.getRange(start, end).toList());
    }, onError: ctrl.addError).whenComplete(ctrl.close);
    return ctrl.stream;
  }

  @override
  RandomAccessFile openSync({FileMode mode = FileMode.read}) =>
      throw asyncOnly();

  @override
  IOSink openWrite({FileMode mode = FileMode.write, Encoding encoding = utf8}) {
    // TODO: implement openWrite
    return null;
  }

  @override
  Directory get parent => AssetDirectory(fileSystem, context.dirname(path));

  @override
  Future<List<int>> readAsBytes() => fileSystem.reader.readAsBytes(assetId);

  @override
  List<int> readAsBytesSync() => throw asyncOnly();

  @override
  Future<List<String>> readAsLines({Encoding encoding = utf8}) {
    return readAsString(encoding: encoding).then(LineSplitter().convert);
  }

  @override
  List<String> readAsLinesSync({Encoding encoding = utf8}) => throw asyncOnly();

  @override
  Future<String> readAsString({Encoding encoding = utf8}) =>
      fileSystem.reader.readAsString(assetId, encoding: encoding);

  @override
  String readAsStringSync({Encoding encoding = utf8}) => throw asyncOnly();

  @override
  Future<File> rename(String newPath) {
    // Since we can't delete files, return a copied version.
    return copy(newPath);
  }

  @override
  File renameSync(String newPath) => throw asyncOnly();

  @override
  Future<String> resolveSymbolicLinks() => throw _unsupported('symbolic link');

  @override
  String resolveSymbolicLinksSync() => throw asyncOnly();

  @override
  Future setLastAccessed(DateTime time) => Future.value();

  @override
  void setLastAccessedSync(DateTime time) => throw asyncOnly();

  @override
  Future setLastModified(DateTime time) => Future.value();

  @override
  void setLastModifiedSync(DateTime time) => throw asyncOnly();

  @override
  Future<FileStat> stat() {
    // TODO: implement stat
    return null;
  }

  @override
  FileStat statSync() => throw asyncOnly();

  @override
  Uri get uri => assetId.uri;

  @override
  Stream<FileSystemEvent> watch(
          {int events = FileSystemEvent.all, bool recursive = false}) =>
      throw _unsupported('watch');

  @override
  Future<File> writeAsBytes(List<int> bytes,
      {FileMode mode = io.FileMode.write, bool flush = false}) {
    return fileSystem.writer.writeAsBytes(assetId, bytes).then((_) => this);
  }

  @override
  void writeAsBytesSync(List<int> bytes,
          {FileMode mode = FileMode.write, bool flush = false}) =>
      throw asyncOnly();

  @override
  Future<File> writeAsString(String contents,
      {FileMode mode = io.FileMode.write,
      Encoding encoding = utf8,
      bool flush = false}) {
    return fileSystem.writer
        .writeAsString(assetId, contents, encoding: encoding)
        .then((_) => this);
  }

  @override
  void writeAsStringSync(String contents,
          {FileMode mode = FileMode.write,
          Encoding encoding = utf8,
          bool flush = false}) =>
      throw asyncOnly();
}
