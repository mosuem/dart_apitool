import 'dart:async';
import 'dart:convert';
import 'dart:io';

/// defines a stdout session that supports opening a "window" for subprocesses that has a limited height
class StdoutSession {
  final _utf8Decoder = Utf8Decoder();
  final _utf8Encoder = Utf8Encoder();

  int? _currentWindowSize;
  int? _lastDrawnWindowSize;
  final _windowLines = <String>[];

  Completer<void>? _writeCompleter;

  /// Whether colors should be used based on whether stdout is a terminal
  bool get _shouldUseColors => stdioType(stdout) == StdioType.terminal;

  /// writes the given [bytes] to the console
  Future write(List<int> bytes) async {
    // make sure that only one write is active at a time (needed for flush to work)
    if (_writeCompleter != null) {
      await _writeCompleter!.future;
    }
    _writeCompleter = Completer();
    final localCompleter = _writeCompleter!;

    String stringContent = _utf8Decoder.convert(bytes);
    if (_currentWindowSize != null) {
      if (stringContent.length > 1 && stringContent.endsWith('\n')) {
        stringContent = stringContent.substring(0, stringContent.length - 1);
      }
      _windowLines.addAll(stringContent.split('\n'));
      while (_windowLines.length > _currentWindowSize!) {
        _windowLines.removeAt(0);
      }
      _drawWindow();
      await stdout.flush();
    } else {
      stdout.write(stringContent);
    }

    _writeCompleter = null;
    localCompleter.complete();
  }

  /// writes the given [string] to the console
  Future writeln([String string = ""]) async {
    await write(_utf8Encoder.convert('$string\n'));
  }

  /// opens a subprocess output window with the given [height]
  void openSubprocessOutputWindow({int height = 10}) {
    // only open a subprocess output window if a terminal is attached to stdout
    if (stdout.hasTerminal) {
      _windowLines.clear();
      _currentWindowSize = height;
      _drawWindow();
      stdout.write('\x1B[?25l'); // hide cursor
    }
  }

  /// closes the subprocess output window
  void closeSubprocessOutputWindow() {
    if (_currentWindowSize != null) {
      _drawWindow(doClear: true); // erase window
      _windowLines.clear();
      if (_lastDrawnWindowSize != null && _lastDrawnWindowSize! > 0) {
        stdout.write('\x1B[${_lastDrawnWindowSize}A');
      }
      _currentWindowSize = null;
      _lastDrawnWindowSize = null;
      stdout.write('\x1B[?25h'); // show cursor
    }
  }

  void _drawWindow({bool doClear = false}) {
    if (_lastDrawnWindowSize != null && _lastDrawnWindowSize! > 0) {
      stdout.write('\x1B[${_lastDrawnWindowSize}A');
    }
    if (_shouldUseColors) {
      stdout.write('\x1B[90m'); // gray text
    }
    _lastDrawnWindowSize = _windowLines.length;
    for (var i = 0; i < _windowLines.length; i++) {
      stdout.write('\x1B[2K'); // erase line
      if (!doClear) {
        stdout.write('> ${_windowLines[i]}');
      }
      stdout.write('\x1B[B'); // move cursor down
      stdout.write('\r'); // move to column 0
    }
    if (_shouldUseColors) {
      stdout.write('\x1B[39m'); // reset text color
    }
  }
}
