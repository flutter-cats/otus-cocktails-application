import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

mixin ErrorStatefullHandler<T extends StatefulWidget> on State<T> {
  showError(BuildContext context, dynamic error) {
    context.showError(error);
  }
}

mixin ErrorStatelessHandler on StatelessWidget {
  showError(BuildContext context, dynamic error) {
    context.showError(error);
  }
}

extension ErrorExtension on BuildContext {
  showError(dynamic error) {
    final text = errorHandler(error);
    showErrorText(text);
  }

  showErrorText(String error) {
    ScaffoldMessenger.of(this)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        //margin: EdgeInsets.zero, // only floating
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        content: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(Icons.error_outline, size: 24, color: Colors.red),
          const SizedBox(width: 8),
          Expanded(child: Text(error, style: Theme.of(this).textTheme.apply(bodyColor: Colors.black).subtitle1)),
        ]),
        backgroundColor: Colors.yellow,
        //duration: Duration(seconds: 3),
        //behavior: SnackBarBehavior.fixed, // default
      ));
  }

  String errorHandler(dynamic error) {
    //Logs.w("errorHandler", "Data get ERROR $error");
    if (error is DioError && error.type == DioErrorType.response) {
      if (error.response?.statusCode == 400) {
        return "Введенные данные не приняты сервером"; // Модель не передана или не прошла валидацию
      } else if (error.response?.statusCode == 401) {
        return "Вы не авторизованы, перенаправляем...";
      } else if (error.response?.statusCode == 402) {
        return "Недостаточно прав"; // нет доступа - Пользователь не обладает хотя бы одним требуемым правом
      } else if (error.response?.statusCode == 403) {
        return "Доступ запрещен"; // нет доступа - Пользователь не обладает хотя бы одним требуемым правом
      } else if (error.response?.statusCode == 409) {
        return "Авторизация просрочена, перенаправляем...";
      } else if (error.response?.statusCode == 417) {
        return "Таймаут"; // Таймаут ожидания ответа на команду от терминала
      } else if (error.response?.statusCode == 500) {
        return "Ошибка логики сервера"; // Непредвиденная серверная ошибка
      }
      return "Сервер вернул ошибку ${error.response?.statusCode}";
    } else if (error is DioError && (error.type == DioErrorType.connectTimeout || error.type == DioErrorType.receiveTimeout || error.type == DioErrorType.sendTimeout)) {
      return "Сервер не доступен";
    } else if (error is DioError) {
      return "Ошибка выполнения запроса";
    } else if (error is ArgumentError) {
      return error.message?.toString() ?? "Ошибка параметра";
    } else if (error is UnimplementedError) {
      return error.message?.toString() ?? "Не реализовано";
    } else {
      return "Во время выполнения произошла ошибка";
    }
  }
}
