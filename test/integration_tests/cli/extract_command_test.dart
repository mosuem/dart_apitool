import 'package:args/command_runner.dart';
import 'package:dart_apitool/api_tool_cli.dart';
import 'package:test/test.dart';
import 'package:path/path.dart' as path;

import '../helper/integration_test_helper.dart';

void main() {
  group('Extract command', () {
    test(
      'Can handle complex path dependencies',
      () async {
        final extractCommand = ExtractCommand();
        final runner =
            CommandRunner<int>('dart_apitool_tests', 'Test for dart_apitool')
              ..addCommand(extractCommand);
        // executes "extract" command for a set of packages that is linked via path dependencies
        // using "expect()" here results in an early return due to FakeAsync not being able to handle this
        final exitCode = await runner.run([
          'extract',
          '--input',
          path.join(
            'test',
            'test_packages',
            'path_references',
            'cluster_a',
            'package_a',
          ),
          '--include-path-dependencies',
        ]);
        expect(exitCode, 0);
      },
      timeout: integrationTestTimeout,
    );
    test(
      'Fails with path dependencies pointing outside without include-path-dependencies argument',
      () async {
        final extractCommand = ExtractCommand();
        final runner =
            CommandRunner<int>('dart_apitool_tests', 'Test for dart_apitool')
              ..addCommand(extractCommand);
        // executes "extract" command for a set of packages that is linked via path dependencies
        // using "expect()" here results in an early return due to FakeAsync not being able to handle this
        Object? catchedException;
        try {
          await runner.run([
            'extract',
            '--input',
            path.join(
              'test',
              'test_packages',
              'path_references',
              'cluster_a',
              'package_a',
            ),
            // ommitting --include-path-dependencies
          ]);
        } catch (e) {
          catchedException = e;
        }
        expect(catchedException, isA<RunDartError>());
      },
      timeout: integrationTestTimeout,
    );

    test(
      'Can handle pub ref with --include-path-dependencies',
      () async {
        final extractCommand = ExtractCommand();
        final runner =
            CommandRunner<int>('dart_apitool_tests', 'Test for dart_apitool')
              ..addCommand(extractCommand);
        // executes "extract" command for a set of packages that is linked via path dependencies
        // using "expect()" here results in an early return due to FakeAsync not being able to handle this
        await runner.run([
          'extract',
          '--input',
          'pub://dart_apitool/0.5.0',
          '--include-path-dependencies',
        ]);
      },
      timeout: integrationTestTimeout,
    );

    test(
      'Can handle pub ref',
      () async {
        final extractCommand = ExtractCommand();
        final runner =
            CommandRunner<int>('dart_apitool_tests', 'Test for dart_apitool')
              ..addCommand(extractCommand);
        // executes "extract" command for a set of packages that is linked via path dependencies
        // using "expect()" here results in an early return due to FakeAsync not being able to handle this
        await runner.run([
          'extract',
          '--input',
          'pub://dart_apitool/0.4.0',
        ]);
      },
      timeout: integrationTestTimeout,
    );

    test(
      'Can handle nested path dependencies',
      () async {
        final extractCommand = ExtractCommand();
        final runner =
            CommandRunner<int>('dart_apitool_tests', 'Test for dart_apitool')
              ..addCommand(extractCommand);
        // executes "extract" command for a set of packages that is linked via path dependencies
        // using "expect()" here results in an early return due to FakeAsync not being able to handle this
        final exitCode = await runner.run([
          'extract',
          '--input',
          path.join(
            'test',
            'test_packages',
            'nested_path_references',
            'package_a',
          ),
          '--include-path-dependencies',
        ]);
        expect(exitCode, 0);
      },
      timeout: integrationTestTimeout,
    );

    test(
      'Handles `set-exit-on-missing-export` well if nothing is missing',
      () async {
        final extractCommand = ExtractCommand();
        final runner =
            CommandRunner<int>('dart_apitool_tests', 'Test for dart_apitool')
              ..addCommand(extractCommand);
        // executes "extract" command for a package that doesn't misses an export
        // `--set-exit-on-missing-export` is set` and the exit code should be 0 (no missing export found)
        final exitCode = await runner.run([
          'extract',
          '--input',
          path.join(
            'test',
            'test_packages',
            'nested_path_references',
            'package_a',
          ),
          '--include-path-dependencies',
          '--set-exit-on-missing-export',
        ]);
        expect(exitCode, 0);
      },
      timeout: integrationTestTimeout,
    );

    test(
      'Handles `set-exit-on-missing-export` well if an export is missing',
      () async {
        final extractCommand = ExtractCommand();
        final runner =
            CommandRunner<int>('dart_apitool_tests', 'Test for dart_apitool')
              ..addCommand(extractCommand);
        // executes "extract" command for a package that misses an export
        // `--set-exit-on-missing-export` is set` and the exit code should be -1
        final exitCode = await runner.run([
          'extract',
          '--input',
          path.join(
            'test',
            'test_packages',
            'missing_export',
            'package_a',
          ),
          '--set-exit-on-missing-export',
        ]);
        expect(exitCode, -1);
      },
      timeout: integrationTestTimeout,
    );
  });
}
