import 'base.dart';

const String VERSION = '';
const String LOCAL_STORAGE_KEY = '';
const String MAIN_GRAPHQL_KEY = ''; // Todo: needs to be obfuscated

const String NEB_BACKEND_URL = '';
const String NEB_BACKEND_API_URL = '';

const String REGISTRY_DB = '';

const String SECRET_KEY = ''; // Todo: needs to be obfuscated

const String BASIC_USER = '';
const String BASIC_PASSWORD = ''; // Todo: needs to be obfuscated

const String GOOGLEMAP_API_KEY = ''; // Todo: needs to be obfuscated

const String STORAGE_GRPC_HOST = '';
const int STORAGE_GRPC_PORT = 443;

String get host {
// https://github.com/flutter/flutter/issues/36126#issuecomment-596215587
  return '';
}

final graphqlEndpoint = '';
final subscriptionEndpoint = '';

Future<GraphQLClient> getGraphQLClient() async {
  final httpLink = HttpLink(
    graphqlEndpoint,
    defaultHeaders: {
      'content-type': 'application/json',
      'x-hasura-admin-secret': MAIN_GRAPHQL_KEY,
    },
  );

  final authLink = AuthLink(
      getToken: () async => 'Bearer ${await RegistryService.getAuthToken()}');

  // final authLink = AuthLink(getToken: () async => "Bearer");

  final websocketLink = WebSocketLink(
    subscriptionEndpoint,
    config: const SocketClientConfig(
        autoReconnect: true,
        inactivityTimeout: Duration(seconds: 30),
        initialPayload: {
          "headers": {'x-hasura-admin-secret': MAIN_GRAPHQL_KEY}
        }),
  );

  // final _link = authLink.concat(httpLink).concat(websocketLink);

  return GraphQLClient(
    // store: GraphQLCache(store: HiveStore()),
    // cache: OptimisticCache(
    //   dataIdFromObject: typenameDataIdFromObject,
    // ),
    link: httpLink, cache: GraphQLCache(store: HiveStore()),
  );
}
