import 'package:custom_lint_builder/custom_lint_builder.dart';
import 'package:dart_custom_lint/src/lint_rules/avoid_dynamic/avoid_dynamic.dart';

PluginBase createPlugin() => DartCustomLinter();

class DartCustomLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) => [
        const AvoidDynamicLintRule(),
      ];
}
