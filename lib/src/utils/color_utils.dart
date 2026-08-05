import 'dart:io';

/// Utility class for handling colored terminal output.
/// Automatically detects if stdout/stderr are attached to a terminal
/// and disables colors when output is piped to a file.
class ColorUtils {
  /// Whether colors should be enabled for stdout
  static bool get shouldUseColorsForStdout =>
      stdioType(stdout) == StdioType.terminal;

  /// Whether colors should be enabled for stderr
  static bool get shouldUseColorsForStderr =>
      stdioType(stderr) == StdioType.terminal;

  static String _style(String text, String code, bool useColor) {
    if (useColor && text.isNotEmpty) {
      return '\x1B[${code}m$text\x1B[0m';
    }
    return text;
  }

  /// Convenience method for green text on stdout
  static String green(String text) =>
      _style(text, '32', shouldUseColorsForStdout);

  /// Convenience method for red text on stdout
  static String red(String text) =>
      _style(text, '31', shouldUseColorsForStdout);

  /// Convenience method for bold text on stdout
  static String bold(String text) =>
      _style(text, '1', shouldUseColorsForStdout);

  /// Convenience method for italic text on stdout
  static String italic(String text) =>
      _style(text, '3', shouldUseColorsForStdout);

  /// Convenience method for red text on stderr
  static String redError(String text) =>
      _style(text, '31', shouldUseColorsForStderr);

  /// Convenience method for bold red text on stderr
  static String boldRedError(String text) =>
      _style(text, '1;31', shouldUseColorsForStderr);
}
