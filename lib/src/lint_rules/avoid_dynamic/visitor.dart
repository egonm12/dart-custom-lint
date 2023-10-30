part of 'avoid_dynamic.dart';

class _AvoidDynamicVisitor extends RecursiveAstVisitor<void> {
  final _nodes = <AstNode>[];
  Iterable<AstNode> get nodes => _nodes;

  @override
  void visitVariableDeclaration(VariableDeclaration node) {
    final elementType = node.declaredElement?.type;

    if (elementType == null || elementType.isDartCoreMap) {
      return;
    } else if (elementType is DynamicType) {
      _nodes.add(node);
    } else if (elementType is! ParameterizedType) {
      return;
    } else if (elementType.typeArguments.any((t) => t is DynamicType)) {
      _nodes.add(node);
    }
  }
}
