import 'dart:ffi';

import 'package:codde_protocol/src/frb_generated.dart';

typedef ExternalLibrary = DynamicLibrary;

createWrapperImpl(ExternalLibrary dylib) => Impl(dylib);
