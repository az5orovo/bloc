<img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_logo_full.png" height="60" alt="Bloc" />

[![Build Status](https://travis-ci.org/felangel/bloc.svg?branch=master)](https://travis-ci.org/felangel/bloc)
[![codecov](https://codecov.io/gh/felangel/Bloc/branch/master/graph/badge.svg)](https://codecov.io/gh/felangel/bloc)
[![Flutter.io](https://img.shields.io/badge/Flutter-Website-rgb(94%2C201%2C248).svg)](https://flutter.io/docs/development/data-and-backend/state-mgmt/options#bloc--rx)
[![Awesome Flutter](https://img.shields.io/badge/Awesome-Flutter-turquoise.svg?longCache=true)](https://github.com/Solido/awesome-flutter#bloc)
[![Star on GitHub](https://img.shields.io/github/stars/felangel/bloc.svg?style=flat&logo=github&colorB=violet&label=Stars)](https://github.com/felangel/bloc)
[![Gitter](https://img.shields.io/badge/gitter-chat-purple.svg)](https://gitter.im/bloc_package/Lobby)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

---

A predictable state management library that helps implement the [BLoC design pattern](https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc).


| Package                                                                            | Pub                                                                                                             |
| ---------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------- |
| [bloc](https://github.com/felangel/bloc/tree/master/packages/bloc)                 | [![pub package](https://img.shields.io/pub/v/bloc.svg)](https://pub.dartlang.org/packages/bloc)                 |
| [flutter_bloc](https://github.com/felangel/bloc/tree/master/packages/flutter_bloc) | [![pub package](https://img.shields.io/pub/v/flutter_bloc.svg)](https://pub.dartlang.org/packages/flutter_bloc) |
| [angular_bloc](https://github.com/felangel/bloc/tree/master/packages/angular_bloc) | [![pub package](https://img.shields.io/pub/v/angular_bloc.svg)](https://pub.dartlang.org/packages/angular_bloc) |

## Overview

<img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_architecture.png" alt="Bloc Architecture" />

The goal of this library is to make it easy to separate _presentation_ from _business logic_, facilitating testability and reusability.

## Documentation
- [Official Documentation](https://felangel.github.io/bloc)
- [Bloc Package](https://github.com/felangel/Bloc/tree/master/packages/bloc/README.md)
- [Flutter Bloc Package](https://github.com/felangel/Bloc/tree/master/packages/flutter_bloc/README.md)
- [Angular Bloc Package](https://github.com/felangel/Bloc/tree/master/packages/angular_bloc/README.md)

## Examples

<div style="text-align: center">
    <table>
        <tr>
            <td style="text-align: center">
                <a href="https://felangel.github.io/bloc/#/fluttercountertutorial">
                    <img src="https://felangel.github.io/bloc/assets/gifs/flutter_counter.gif" width="200"/>
                </a>
            </td>            
            <td style="text-align: center">
                <a href="https://felangel.github.io/bloc/#/flutterinfinitelisttutorial">
                    <img src="https://felangel.github.io/bloc/assets/gifs/flutter_infinite_list.gif" width="200"/>
                </a>
            </td>
            <td style="text-align: center">
                <a href="https://felangel.github.io/bloc/#/flutterlogintutorial">
                    <img src="https://felangel.github.io/bloc/assets/gifs/flutter_login.gif" width="200" />
                </a>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <a href="https://felangel.github.io/bloc/#/flutterangulargithubsearch">
                    <img src="https://felangel.github.io/bloc/assets/gifs/flutter_github_search.gif" width="200"/>
                </a>
            </td>
            <td style="text-align: center">
                <a href="https://felangel.github.io/bloc/#/flutterweathertutorial">
                    <img src="https://felangel.github.io/bloc/assets/gifs/flutter_weather.gif" width="200"/>
                </a>
            </td>
            <td style="text-align: center">
                <a href="https://github.com/felangel/Bloc/tree/master/examples/flutter_todos">
                    <img src="https://felangel.github.io/bloc/assets/gifs/flutter_todos.gif" width="200"/>
                </a>
            </td>
        </tr>
    </table>
</div>

### Dart

- [Counter](https://github.com/felangel/Bloc/tree/master/packages/bloc/example) - an example of how to create a `CounterBloc` (pure dart).

### Flutter

- [Counter](https://felangel.github.io/bloc/#/fluttercountertutorial) - an example of how to create a `CounterBloc` to implement the classic Flutter Counter app.
- [Infinite List](https://felangel.github.io/bloc/#/flutterinfinitelisttutorial) - an example of how to use the `bloc` and `flutter_bloc` packages to implement an infinite scrolling list.
- [Login Flow](https://felangel.github.io/bloc/#/flutterlogintutorial) - an example of how to use the `bloc` and `flutter_bloc` packages to implement a Login Flow.
- [Github Search](https://felangel.github.io/bloc/#/flutterangulargithubsearch) - an example of how to create a Github Search Application using the `bloc` and `flutter_bloc` packages.
- [Weather](https://felangel.github.io/bloc/#/flutterweathertutorial) - an example of how to create a Weather Application using the `bloc` and `flutter_bloc` packages. The app uses a `RefreshIndicator` to implement "pull-to-refresh" as well as dynamic theming.
- [Todos](https://github.com/felangel/Bloc/tree/master/examples/flutter_todos) - an example of how to create a Todos Application using the `bloc` and `flutter_bloc` packages.

### Web
- [Counter](https://github.com/felangel/Bloc/tree/master/examples/angular_counter) - an example of how to use a `CounterBloc` in an AngularDart app.
- [Github Search](https://github.com/felangel/Bloc/tree/master/examples/github_search/angular_github_search) - an example of how to create a Github Search Application using the `bloc` and `angular_bloc` packages.

### Flutter + Web
- [Github Search](https://github.com/felangel/Bloc/tree/master/examples/github_search) - an example of how to create a Github Search Application and share code between Flutter and AngularDart.

## Articles

- [bloc package](https://medium.com/flutter-community/flutter-bloc-package-295b53e95c5c) - An intro to the bloc package with high level architecture and examples.
- [flutter login tutorial with flutter_bloc](https://medium.com/flutter-community/flutter-login-tutorial-with-flutter-bloc-ea606ef701ad) - How to create a full login flow using the bloc and flutter_bloc packages.
- [unit testing with bloc](https://medium.com/@felangelov/unit-testing-with-bloc-b94de9655d86) - How to unit test the blocs created in the flutter login tutorial.
- [flutter infinite list tutorial with flutter_bloc](https://medium.com/flutter-community/flutter-infinite-list-tutorial-with-flutter-bloc-2fc7a272ec67) - How to create an infinite list using the bloc and flutter_bloc packages.
- [code sharing with bloc](https://medium.com/flutter-community/code-sharing-with-bloc-b867302c18ef) - How to share code between a mobile application written with Flutter and a web application written with AngularDart.
- [weather app tutorial with flutter_bloc](https://medium.com/flutter-community/weather-app-with-flutter-bloc-e24a7253340d) - How to build a weather app which supports dynamic theming, pull-to-refresh, and interacting with a REST API using the bloc and flutter_bloc packages.

## Extensions

- [VSCode](https://marketplace.visualstudio.com/items?itemName=FelixAngelov.bloc#overview) - extends VSCode with support for the Bloc library and provides tools for effectively creating Blocs for both Flutter and AngularDart apps.

## Community

Learn more at the following links, which have been contributed by the community.

### Video Tutorials
- [Flutter Bloc Library Tutorial](https://www.youtube.com/watch?v=LeLrsnHeCZY) - Introduction to the Bloc Library, by [Reso Coder](https://resocoder.com).
- [Flutter Youtube Search](https://www.youtube.com/watch?v=BJY8nuYUM7M) - How to build a Youtube Search app which interacts with an API using the bloc and flutter_bloc packages, by [Reso Coder](https://resocoder.com).
- [Flutter Football Player Search](https://www.youtube.com/watch?v=S2KmxzgsTwk) - How to build a Football Player Search app which interacts with an API using the bloc and flutter_bloc packages, by [Techie Blossom](https://techieblossom.com).

## Maintainers

- [Felix Angelov](https://github.com/felangel)