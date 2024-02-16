// lib/src/ffi.dart
import 'package:codde_protocol/codde_protocol.dart';
import 'ffi/stub.dart'
    if (dart.library.io) 'ffi/io.dart'
    if (dart.library.html) 'ffi/web.dart';

CoddeProtocol createLib() => createWrapper(createLibraryImpl());
