import 'base.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String? uuidFromObject(Object object) {
  if (object is Map<String, Object>) {
    final typeName = object['__typename'];
    final id = object['id'].toString();
    if (typeName != null && id != null) {
      return <String>[typeName as String, id].join('/');
    }
  }
  return null;
}

ValueNotifier<GraphQLClient> getClient() {
  return ValueNotifier<GraphQLClient>(
    locator<GraphQLClient>(),
  );
}

/// Wraps the root application with the `graphql_flutter` client.
/// We use the cache for all state management.
class ClientProvider extends StatelessWidget {
  ClientProvider({
    required this.child,
    required String uri,
    String? subscriptionUri,
  }) : client = getClient();

  final Widget child;
  final ValueNotifier<GraphQLClient> client;

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: child,
    );
  }
}
