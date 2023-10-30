import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

part 'visitor.dart';

class AvoidDynamicLintRule extends DartLintRule {
  const AvoidDynamicLintRule() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_dynamic',
    problemMessage: 'Avoid using dynamic type.',
    errorSeverity: ErrorSeverity.WARNING,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    context.registry.addVariableDeclaration((node) {
      final visitor = _AvoidDynamicVisitor();

      node.accept(visitor);

      for (final node in visitor.nodes) {
        reporter.reportErrorForNode(code, node);
      }
    });
  }
}
