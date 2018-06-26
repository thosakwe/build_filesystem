import 'dart:async';
import 'package:build/build.dart';
import 'package:file/file.dart';
import 'filesystem.dart';

class AssetDirectory extends Directory {
  // TODO: implement absolute
  @override
  Directory get absolute => null;

  // TODO: implement basename
  @override
  String get basename => null;

  @override
  Directory childDirectory(String basename) {
    // TODO: implement childDirectory
  }

  @override
  File childFile(String basename) {
    // TODO: implement childFile
  }

  @override
  Link childLink(String basename) {
    // TODO: implement childLink
  }

  @override
  Future<Directory> create({bool recursive: false}) {
    // TODO: implement create
  }

  @override
  void createSync({bool recursive: false}) {
    // TODO: implement createSync
  }

  @override
  Future<Directory> createTemp([String prefix]) {
    // TODO: implement createTemp
  }

  @override
  Directory createTempSync([String prefix]) {
    // TODO: implement createTempSync
  }

  @override
  Future<FileSystemEntity> delete({bool recursive: false}) {
    // TODO: implement delete
  }

  @override
  void deleteSync({bool recursive: false}) {
    // TODO: implement deleteSync
  }

  // TODO: implement dirname
  @override
  String get dirname => null;

  @override
  Future<bool> exists() {
    // TODO: implement exists
  }

  @override
  bool existsSync() {
    // TODO: implement existsSync
  }

  // TODO: implement fileSystem
  @override
  FileSystem get fileSystem => null;

  // TODO: implement isAbsolute
  @override
  bool get isAbsolute => null;

  @override
  Stream<FileSystemEntity> list({bool recursive: false, bool followLinks: true}) {
    // TODO: implement list
  }

  @override
  List<FileSystemEntity> listSync({bool recursive: false, bool followLinks: true}) {
    // TODO: implement listSync
  }

  // TODO: implement parent
  @override
  Directory get parent => null;

  // TODO: implement path
  @override
  String get path => null;

  @override
  Future<Directory> rename(String newPath) {
    // TODO: implement rename
  }

  @override
  Directory renameSync(String newPath) {
    // TODO: implement renameSync
  }

  @override
  Future<String> resolveSymbolicLinks() {
    // TODO: implement resolveSymbolicLinks
  }

  @override
  String resolveSymbolicLinksSync() {
    // TODO: implement resolveSymbolicLinksSync
  }

  @override
  Future<FileStat> stat() {
    // TODO: implement stat
  }

  @override
  FileStat statSync() {
    // TODO: implement statSync
  }

  // TODO: implement uri
  @override
  Uri get uri => null;

  @override
  Stream<FileSystemEvent> watch({int events: FileSystemEvent.ALL, bool recursive: false}) {
    // TODO: implement watch
  }

}