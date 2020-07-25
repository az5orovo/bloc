import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:user_repository/user_repository.dart';

class MockAuthenticationRepository extends Mock
    implements AuthenticationRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  const user = User('id');
  AuthenticationRepository authenticationRepository;
  UserRepository userRepository;

  setUp(() {
    authenticationRepository = MockAuthenticationRepository();
    when(authenticationRepository.status)
        .thenAnswer((_) => const Stream.empty());
    userRepository = MockUserRepository();
  });

  group('AuthenticationBloc', () {
    test('throws when authenticationRepository is null', () {
      expect(
        () => AuthenticationBloc(
          authenticationRepository: null,
          userRepository: userRepository,
        ),
        throwsAssertionError,
      );
    });

    test('throws when userRepository is null', () {
      expect(
        () => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: null,
        ),
        throwsAssertionError,
      );
    });

    test('initial state is AuthenticationState.unknown', () {
      final authenticationBloc = AuthenticationBloc(
        authenticationRepository: authenticationRepository,
        userRepository: userRepository,
      );
      expect(authenticationBloc.state, const AuthenticationState.unknown());
      authenticationBloc.close();
    });

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unauthenticated] when status is unauthenticated',
      build: () {
        when(authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.unauthenticated),
        );
        return AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        );
      },
      expect: const <AuthenticationState>[
        AuthenticationState.unauthenticated(),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [authenticated] when status is authenticated',
      build: () {
        when(authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.authenticated),
        );
        when(userRepository.getUser()).thenAnswer((_) async => user);
        return AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        );
      },
      expect: const <AuthenticationState>[
        AuthenticationState.authenticated(user)
      ],
    );
  });

  group('UserChanged', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [authenticated] when status is authenticated',
      build: () {
        when(authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.authenticated),
        );
        when(userRepository.getUser()).thenAnswer((_) async => user);
        return AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        );
      },
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.authenticated),
      ),
      expect: const <AuthenticationState>[
        AuthenticationState.authenticated(user)
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unauthenticated] when status is unauthenticated',
      build: () {
        when(authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.unauthenticated),
        );
        return AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        );
      },
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.unauthenticated),
      ),
      expect: const <AuthenticationState>[
        AuthenticationState.unauthenticated()
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unauthenticated] when status is authenticated but getUser fails',
      build: () {
        when(authenticationRepository.status).thenAnswer(
          (_) => const Stream.empty(),
        );
        when(userRepository.getUser()).thenThrow(Exception('oops'));
        return AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        );
      },
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.authenticated),
      ),
      expect: const <AuthenticationState>[
        AuthenticationState.unauthenticated()
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unauthenticated] when status is authenticated '
      'but getUser returns null',
      build: () {
        when(authenticationRepository.status).thenAnswer(
          (_) => const Stream.empty(),
        );
        when(userRepository.getUser()).thenAnswer((_) async => null);
        return AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        );
      },
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.authenticated),
      ),
      expect: const <AuthenticationState>[
        AuthenticationState.unauthenticated()
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unknown] when status is unknown',
      build: () {
        when(authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.unknown),
        );
        return AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        );
      },
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.unknown),
      ),
      expect: const <AuthenticationState>[
        AuthenticationState.unknown(),
      ],
    );
  });

  group('LoggedOut', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [unauthenticated]',
      build: () {
        when(authenticationRepository.status).thenAnswer(
          (_) => Stream.value(AuthenticationStatus.unauthenticated),
        );
        return AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        );
      },
      act: (bloc) => bloc.add(
        const AuthenticationStatusChanged(AuthenticationStatus.unauthenticated),
      ),
      expect: const <AuthenticationState>[
        AuthenticationState.unauthenticated(),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'calls logOut on authenticationRepository '
      'when LoggedOut is added',
      build: () {
        when(authenticationRepository.status).thenAnswer(
          (_) => const Stream.empty(),
        );
        return AuthenticationBloc(
          authenticationRepository: authenticationRepository,
          userRepository: userRepository,
        );
      },
      act: (bloc) => bloc.add(LoggedOut()),
      verify: (_) {
        verify(authenticationRepository.logOut()).called(1);
      },
    );
  });
}
