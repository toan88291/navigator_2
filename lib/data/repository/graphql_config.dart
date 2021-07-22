import 'package:coinhe/common/app_session.dart';
import 'package:coinhe/constant/preference_key.dart';
import 'package:coinhe/utils/utils.dart';
import "package:flutter/material.dart";
import 'package:graphql/client.dart';

class GraphQLConfiguration {
  static Link link = null;
  static Link linkTournament = null;
  static const String UNAUTHENTICATED = "UNAUTHENTICATED";
  static const String TOKENTEMPORARYERROR = "TokenTemporaryError";

  static void setToken(String token) {
    AuthLink alink = AuthLink(getToken: () async => 'Bearer ' + token);
    GraphQLConfiguration.link = alink.concat(HttpLink(
      PreferenceKey.apiUri,
      defaultHeaders: <String, String>{
        'Accept-Language':
            '${getLocaleByCountry(AppSession().languageSelect).languageCode}',
        if (AppSession().userAgent != null)
          'user-agent':
          '${AppSession().userAgent}',
      },
    ));
  }

  static void removeToken() {
    GraphQLConfiguration.link = null;
  }

  static Link getLink(bool isSubcription) {
    if (isSubcription) {
      final WebSocketLink websocketLink = WebSocketLink(
        PreferenceKey.webSocket,
        config: SocketClientConfig(
            autoReconnect: true,
            inactivityTimeout: null,
            delayBetweenReconnectionAttempts: Duration(seconds: 1),
            initialPayload: () {
              return {
                'token': '${AppSession().token}',
                'Authorization': '${AppSession().token}',
                'authToken': '${AppSession().token}'
              };
            }),
      );

      return link.concat(websocketLink);
    } else {
      return GraphQLConfiguration.link != null
          ? GraphQLConfiguration.link
          : HttpLink(
              PreferenceKey.apiUri,
              defaultHeaders: <String, String>{
                'Accept-Language':
                    '${getLocaleByCountry(AppSession().languageSelect).languageCode}',
                if (AppSession().userAgent != null)
                  'user-agent':
                  '${AppSession().userAgent}',
              },
            );
    }
  }

  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    link: getLink(false),
    cache: GraphQLCache(),
  ));

  Future<GraphQLClient> clientToQuery(bool isSubcription) async {
    final store = await HiveStore.open(path: 'my/cache/path');
    return GraphQLClient(
      cache: GraphQLCache(store: store),
      link: getLink(isSubcription),
    );
  }

}
