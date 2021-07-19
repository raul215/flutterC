import 'dart:ffi' as ffi;
import 'package:path/path.dart' as path;

import 'dart:io' show Platform, Directory;

typedef FetchNumberFunc = ffi.Int32 Function();
typedef FetchNumber = int Function();

typedef fetch_number_func = ffi.Int32 Function();

typedef log2_func = ffi.Int32 Function(ffi.Int32 a);
typedef log2 = int Function(int a);

typedef sum_func = ffi.Int32 Function(ffi.Int32 a, ffi.Int32 b);
typedef sum = int Function(int a, int b);

void main(List<String> arguments) {
  var libraryPath =
      path.join(Directory.current.path, 'library/linux/', 'libfft.so.1.0.0');

  final dylib = ffi.DynamicLibrary.open(libraryPath);

  // final fetchNumberPointer =
  //     dylib.lookup<ffi.NativeFunction<fetch_number_func>>(
  //   'fetch_number',
  // );

  // final number = fetchNumberPointer.asFunction<FetchNumber>();
  // print(number());

  final log2Pointer = dylib.lookup<ffi.NativeFunction<log2_func>>('log2');

  final _log2 = log2Pointer.asFunction<log2>();

  // final sumPointer = dylib.lookup<ffi.NativeFunction<sum_func>>('sum');

  // final _sum = sumPointer.asFunction<sum>();

  print('log2 of 2 is ${_log2(2)}');

  // print('sum of 2 and 3  ${_sum(2, 3)}');
}
