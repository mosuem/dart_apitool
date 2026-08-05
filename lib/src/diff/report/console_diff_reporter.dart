import 'dart:io';

import '../../../api_tool.dart';
import '../../cli/commands/version_check.dart';
import 'diff_reporter.dart';

class ConsoleDiffReporter extends DiffReporter {
  @override
  final String reporterName = 'Console Reporter';

  @override
  Future<void> generateReport(
    PackageApiDiffResult diffResult,
    VersionCheckResult? versionCheckResult,
  ) async {
    void printChanges(bool breaking) {
      final changes = _printApiChangeNode(diffResult.rootNode, breaking);
      if (changes == null) {
        stdout.writeln(
            breaking ? 'No breaking changes!' : 'No non-breaking changes!');
      } else {
        stdout.write(changes);
      }
    }

    // Print the diffs
    if (diffResult.hasChanges) {
      printChanges(true); // Breaking changes
      printChanges(false); // Non-breaking changes
      stdout.writeln(
        'To learn more about the detected changes visit: https://github.com/bmw-tech/dart_apitool/blob/main/readme/change_codes.md',
      );
    } else {
      stdout.writeln('No changes detected!');
    }

    if (versionCheckResult != null) {
      stdout.writeln('Version Check');
      if (versionCheckResult.success) {
        stdout.writeln(ColorUtils.green('New version is OK!'));
      } else {
        stdout.writeln(ColorUtils.red('New Version is too low!'));
      }
      stdout.writeln();
      stdout.writeln('Old version: "${versionCheckResult.oldVersion}"');
      stdout.writeln('New version: "${versionCheckResult.newVersion}"');
      if (versionCheckResult.neededVersion != null) {
        stdout.writeln('Needed version: "${versionCheckResult.neededVersion}"');
      }
      stdout.writeln();
      stdout.writeln(versionCheckResult.explanation);
    }
  }

  String? _printApiChangeNode(ApiChangeTreeNode node, bool breaking) {
    Map nodeToTree(ApiChangeTreeNode n, {String? labelOverride}) {
      final relevantChanges = n.changes.where((c) => c.isBreaking == breaking);
      final changeNodes = relevantChanges.map((c) =>
          '${ColorUtils.italic(c.changeDescription)} (${c.changeCode.code})${c.isBreaking ? '' : c.type.requiresMinorBump ? ' (minor)' : ' (patch)'}');
      final childNodes = n.children.values
          .map((value) => nodeToTree(value))
          .where((element) => element.isNotEmpty);
      final allChildren = [...changeNodes, ...childNodes];
      return allChildren.isEmpty
          ? {}
          : {
              'label': ColorUtils.bold(labelOverride ??
                  (n.nodeDeclaration == null
                      ? ''
                      : getDeclarationNodeHeadline(n.nodeDeclaration!))),
              'nodes': allChildren,
            };
    }

    final nodes = nodeToTree(node,
        labelOverride: breaking ? 'BREAKING CHANGES' : 'Non-Breaking changes');

    return nodes.isEmpty ? null : _createTree(nodes);
  }

  String _createTree(Map<dynamic, dynamic> tree) {
    final buffer = StringBuffer();
    final label = tree['label']?.toString() ?? '';
    buffer.writeln(label);
    final nodes = tree['nodes'] as List<dynamic>? ?? [];
    _writeTreeNodes(buffer, nodes, '');
    return buffer.toString();
  }

  void _writeTreeNodes(
      StringBuffer buffer, List<dynamic> nodes, String prefix) {
    for (var i = 0; i < nodes.length; i++) {
      final isLast = i == nodes.length - 1;
      final connector = isLast ? '└── ' : '├── ';
      final childPrefix = prefix + (isLast ? '    ' : '│   ');
      final node = nodes[i];
      if (node is Map) {
        final label = node['label']?.toString() ?? '';
        buffer.writeln('$prefix$connector$label');
        final childNodes = node['nodes'] as List<dynamic>? ?? [];
        _writeTreeNodes(buffer, childNodes, childPrefix);
      } else {
        buffer.writeln('$prefix$connector$node');
      }
    }
  }
}
