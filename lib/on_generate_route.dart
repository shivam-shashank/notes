import 'package:flutter/material.dart';
import 'package:notes/core/constants/pages.dart';

import 'core/presentation/pages/error_page.dart';
import 'features/note/domain/entities/note_entity.dart';
import 'features/note/presentation/pages/add_new_note_page.dart';
import 'features/note/presentation/pages/sign_in_page.dart';
import 'features/note/presentation/pages/sign_up_page.dart';
import 'features/note/presentation/pages/update_note_page.dart';

class OnGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Pages.signInPage:
        {
          return materialBuilder(widget: const SignInPage());
        }
      case Pages.signUpPage:
        {
          return materialBuilder(widget: const SignUpPage());
        }
      case Pages.addNotePage:
        {
          if (args is String) {
            return materialBuilder(
              widget: AddNewNotePage(
                uid: args,
              ),
            );
          } else {
            return materialBuilder(
              widget: const ErrorPage(),
            );
          }
        }
      case Pages.updateNotePage:
        {
          if (args is NoteEntity) {
            return materialBuilder(
              widget: UpdateNotePage(
                noteEntity: args,
              ),
            );
          } else {
            return materialBuilder(
              widget: const ErrorPage(),
            );
          }
        }
      default:
        return materialBuilder(widget: const ErrorPage());
    }
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
