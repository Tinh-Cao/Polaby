import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class PolabyMobileAuthUser {
  PolabyMobileAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<PolabyMobileAuthUser> polabyMobileAuthUserSubject =
    BehaviorSubject.seeded(PolabyMobileAuthUser(loggedIn: false));
Stream<PolabyMobileAuthUser> polabyMobileAuthUserStream() =>
    polabyMobileAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
