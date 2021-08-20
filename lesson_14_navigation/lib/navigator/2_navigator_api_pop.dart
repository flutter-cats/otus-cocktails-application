import 'package:flutter/material.dart';

// Пример открытия экрана с помощью инстанцирования Route
// внутри методов push,replace

class NavigatorApiPopRoutes extends StatelessWidget {
  final int pageIndex;

  const NavigatorApiPopRoutes({Key? key, this.pageIndex = 1}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page $pageIndex'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => _pushNextPage(context),
                child: Text('open Next Page')),
            const SizedBox(height: 16),
            Visibility(
              //visible: Navigator.of(context).canPop(),
              visible: true,
              child: TextButton(
                onPressed: () => _back(context),
                child: Text('back'),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
                onPressed: () => _backToRoot(context),
                child: Text('back to root')),
            TextButton(
                onPressed: () => maybePop(context),
                child: Text('maybePop')),
          ],
        ),
      ),
    );
  }

  _pushNextPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return NavigatorApiPopRoutes(pageIndex: pageIndex + 1);
    }));
  }

  _back(BuildContext context) {
    Navigator.of(context).pop();
  }

  _backToRoot(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  maybePop(BuildContext context) {
    Navigator.of(context).maybePop();
    // if (Navigator.of(context).canPop()){
    //   Navigator.of(context).pop();
    // }
  }
}

// - проверяет является ли текущий Route не последним в стэке.
// Navigator.canPop

//- проеряет возможность удалить текущий Route из стека и удаляет его при возможности
// Navigator.maybePop

// Удаляет текущий Route
// Navigator.pop
