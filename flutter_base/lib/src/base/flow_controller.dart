library flutter_base;

import 'base.dart';
import 'package:flutter_base/src/widget/design.dart';
import 'package:flutter/cupertino.dart';

class AppPage {
  AppPage(this.name, this.widget, {this.isModalRootPage = false});

  final String name;
  final Widget widget;
  final bool? isModalRootPage;
}

abstract class FlowControllerState<T extends StatefulWidget> extends State<T>
    implements BackPressHandler<T> {
  FlowControllerState();

  late GlobalKey<NavigatorState> _navKey;
  PopScopeHostSubscription? _popScopeHostSubscription;
  late RouteObserver _routeObserver;

  late List<String> _navStack;

  @override
  void initState() {
    super.initState();
    _navStack = [];
    _navKey = GlobalObjectKey<NavigatorState>(this);
    _routeObserver = RouteObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _popScopeHostSubscription?.dispose();
    _popScopeHostSubscription = PopScopeHost.subscribe(context, this);
  }

  @override
  void dispose() {
    _popScopeHostSubscription?.dispose();
    super.dispose();
  }

  AppPage createInitialPage();

  @override
  bool handleBackPressed() {
    final nav = _navigator();
    if (nav?.canPop() ?? false) {
      nav?.pop();
      return true;
    } else {
      return false;
    }
  }

  @override
  void onBackPressed() {
    if (!handleBackPressed()) {
      var parentHandler = context.findAncestorStateOfType<BackPressHandler>();
      parentHandler?.onBackPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: _navKey,
        observers: [_routeObserver],
        onGenerateRoute: (s) {
          var page = createInitialPage();
          _navStack.add(page.name);
          return !(page.isModalRootPage ?? false)
              ? _buildRoute((s) => page.widget, page.name)
              : _buildMaterialModalRoute((s) => page.widget, page.name);
        });
  }

  void pushSimple(Widget Function() builder, String name) {
    push(_buildRoute((c) => builder(), name));
  }

  void pushToPageWithModal(Widget Function() builder, String name) {
    push(_buildMaterialModalRoute((c) => builder(), name));
  }

  // ignore: avoid_shadowing_type_parameters
  void pop<T>({T? result}) {
    _navStack.removeLast();
    _navigator()?.pop(result);
  }

  Future<R?> push<R>(Route<R> route) {
    assert(route.settings.name != null);
    _navStack.add(route.settings.name!);
    return _navigator()!.push(route);
  }

  void popUntilFound(String name) {
    _navigator()?.popUntil((route) {
      final willPop = route.settings.name != name;
      if (willPop) _navStack.removeLast();
      return !willPop;
    });
  }

  // ignore: avoid_shadowing_type_parameters
  Future<T?> pushAndRemoveUntil<T extends Object>(
      Route<T> route, RoutePredicate predicate) {
    return _navigator()!.pushAndRemoveUntil(route, (route) {
      final willPop = !predicate(route);
      if (willPop) {
        _navStack.removeLast();
      } else {
        assert(route.settings.name != null);
        _navStack.add(route.settings.name!);
      }
      return !willPop;
    });
  }

  bool canPop() => _navigator()!.canPop();

  bool containsChild(String routeName) =>
      _navStack.any((element) => element == routeName);

  bool isDisplayed(String routeName) => _navStack.last == routeName;

  RouteObserver routeObserver() => _routeObserver;

  NavigatorState? _navigator() => _navKey.currentState;

  Route<R> _buildRoute<R>(WidgetBuilder builder, String name) {
    return CupertinoPageRoute(
        builder: builder, settings: RouteSettings(name: name));
  }

  Route<R> _buildMaterialModalRoute<R>(WidgetBuilder builder, String name) {
    return MaterialWithModalsPageRoute(
        builder: builder, settings: RouteSettings(name: name));
  }
}
