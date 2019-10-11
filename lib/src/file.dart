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

  @override
  File copySync(String newPath) => throw asyncOnly();

  @override
  Future<File> create({bool recursive = false}) {
    // TODO: implement create
    return null;
  }

  @override
  void createSync({bool recursive = false}) => throw asyncOnly();

  @override
  Future<FileSystemEntity> delete({bool recursive = false}) {
    // TODO: implement delete
    return null;
  }

  @override
  void deleteSync({bool recursive = false}) => throw asyncOnly();

  @override
  // TODO: implement dirname
  String get dirname => null;

  @override
  Future<bool> exists() {
    // TODO: implement exists
    return null;
  }

  @override
  bool existsSync() => throw asyncOnly();

  @override
  // TODO: implement isAbsolute
  bool get isAbsolute => null;

  @override
  Future<DateTime> lastAccessed() {
    // TODO: implement lastAccessed
    return null;
  }

  @override
  DateTime lastAccessedSync() => throw asyncOnly();

  @override
  Future<DateTime> lastModified() {
    // TODO: implement lastModified
    return null;
  }

  @override
  DateTime lastModifiedSync() => throw asyncOnly();

  @override
  Future<int> length() {
    // TODO: implement length
    return null;
  }

  @override
  int lengthSync() => throw asyncOnly();

  @override
  Future<RandomAccessFile> open({FileMode mode = FileMode.read}) {
    // TODO: implement open
    return null;
  }

  @override
  Stream<List<int>> openRead([int start, int end]) {
    // TODO: implement openRead
    return null;
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
  // TODO: implement parent
  Directory get parent => null;

  @override
  Future<List<int>> readAsBytes() {
    // TODO: implement readAsBytes
    return null;
  }

  @override
  List<int> readAsBytesSync() => throw asyncOnly();

  @override
  Future<List<String>> readAsLines({Encoding encoding = utf8}) {
    // TODO: implement readAsLines
    return null;
  }

  @override
  List<String> readAsLinesSync({Encoding encoding = utf8}) => throw asyncOnly();

  @override
  Future<String> readAsString({Encoding encoding = utf8}) {
    // TODO: implement readAsString
    return null;
  }

  @override
  String readAsStringSync({Encoding encoding = utf8}) => throw asyncOnly();

  @override
  Future<File> rename(String newPath) {
    // TODO: implement rename
    return null;
  }

  @override
  File renameSync(String newPath) => throw asyncOnly();

  @override
  Future<String> resolveSymbolicLinks() {
    // TODO: implement resolveSymbolicLinks
    return null;
  }

  @override
  String resolveSymbolicLinksSync() => throw asyncOnly();

  @override
  Future setLastAccessed(DateTime time) {
    // TODO: implement setLastAccessed
    return null;
  }

  @override
  void setLastAccessedSync(DateTime time) => throw asyncOnly();

  @override
  Future setLastModified(DateTime time) {
    // TODO: implement setLastModified
    return null;
  }

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
  // TODO: implement uri
  Uri get uri => null;

  @override
  Stream<FileSystemEvent> watch(
      {int events = FileSystemEvent.all, bool recursive = false}) {
    // TODO: implement watch
    return null;
  }

  @override
  Future<File> writeAsBytes(List<int> bytes,
      {FileMode mode = io.FileMode.write, bool flush = false}) {
    // TODO: implement writeAsBytes
    return null;
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
    // TODO: implement writeAsString
    return null;
  }

  @override
  void writeAsStringSync(String contents,
          {FileMode mode = FileMode.write,
          Encoding encoding = utf8,
          bool flush = false}) =>
      throw asyncOnly();
}
