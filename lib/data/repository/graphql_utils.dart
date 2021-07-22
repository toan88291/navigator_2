import 'dart:io';
import 'package:coinhe/common/app_session.dart';
import 'package:graphql/client.dart';
import 'graphql_config.dart';



String readExceptionFromServer(QueryResult result) {
    // if (result.exception.graphqlErrors != null && result.exception.graphqlErrors.length > 0) {
    //     if (AppSession().token != null && AppSession().token.isNotEmpty && result.exception.graphqlErrors[0].raw != null && result.exception.graphqlErrors[0].raw["name"] != null &&
    //         result.exception.graphqlErrors[0].raw["name"] == GraphQLConfiguration.UNAUTHENTICATED) {
    //         return result.exception.graphqlErrors[0].raw["name"];
    //     } else if (result.exception.graphqlErrors[0].raw != null && result.exception.graphqlErrors[0].raw["name"] != null &&
    //         result.exception.graphqlErrors[0].raw["name"] == GraphQLConfiguration.TOKENTEMPORARYERROR) {
    //         return result.exception.graphqlErrors[0].raw["name"];
    //     }
    //     return result.exception.graphqlErrors[0].message;
    // } else {
    //     return 'http_error_code_500';
    // }
    return null;
}

Future<bool> checkNetwork() async{
    try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
            return Future<bool>.value(true);
        }
    } on SocketException catch (_) {
        return Future<bool>.value(false);
    }
    return Future<bool>.value(false);
}