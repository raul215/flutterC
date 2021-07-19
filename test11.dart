import 'dart:ffi' as ffi;
import 'package:path/path.dart' as path;

import 'dart:io';

typedef sum_func = ffi.Int32 Function(ffi.Int32 a, ffi.Int32 b);
typedef Sum = int Function(int a, int b);

void main(List<String> args) {
  var libraryPath =
      path.join(Directory.current.path, 'library/linux/', 'libfft.so.1.0.0');
  final dylib = ffi.DynamicLibrary.open(libraryPath);
  final sumPointer = dylib.lookup<ffi.NativeFunction<sum_func>>('sum');

  final sum = sumPointer.asFunction<Sum>();
  print('3 + 5 = ${sum(3, 5)}');
}
