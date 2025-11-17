

part of 'app_routes.dart';

/// generated route for
/// [DetailScreen]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    Key? key,
    required int productId,
    required String productName,
    List<PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            productId: productId,
            productName: productName,
          ),
          rawPathParams: {'id': productId},
          rawQueryParams: {'name': productName},
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final pathParams = data.pathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<DetailRouteArgs>(
        orElse: () => DetailRouteArgs(
          productId: pathParams.getInt('id'),
          productName: queryParams.getString('name'),
        ),
      );
      return DetailScreen(
        key: args.key,
        productId: args.productId,
        productName: args.productName,
      );
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.productId,
    required this.productName,
  });

  final Key? key;

  final int productId;

  final String productName;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, productId: $productId, productName: $productName}';
  }
}

/// generated route for
/// [GuardScreen]
class GuardRoute extends PageRouteInfo<void> {
  const GuardRoute({List<PageRouteInfo>? children})
      : super(
          GuardRoute.name,
          initialChildren: children,
        );

  static const String name = 'GuardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GuardScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [SecondScreen]
class SecondRoute extends PageRouteInfo<void> {
  const SecondRoute({List<PageRouteInfo>? children})
      : super(
          SecondRoute.name,
          initialChildren: children,
        );

  static const String name = 'SecondRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SecondScreen();
    },
  );
}