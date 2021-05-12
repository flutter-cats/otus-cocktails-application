## Первая часть домашнего задания:
- [ ] На следующих экранах перечислены несколько представлений тестового приложения:

- [ ] RandomCoctailPage - lib/ui/pages/random_cocktail_page.dart

- [ ] FilterResultsPage - lib/ui/pages/filter_results_page.dart

- [ ] CoctailDetailsPage - lib/ui/pages/details/cocktail_detail_page.dart

- [ ] Переход к каждому экрану сопровождается показом виджета CircularProgressIndicator из Flutter SDK.

- [ ] Этот виджет нужно реализовать самостоятельно, используя стандартные средства Flutter для работы с графическим canvas и средства анимации. И затем переиспользовать вместо CircularProgressIndicator  (в местах отмеченных///todo:)

- [ ] Поведение индикатора описано здесь:
** https://material.io/components/progress-indicators#circular-progress-indicators

## Вторая часть домашнего задания:
- [ ] На каждом из экранов вы видите иконку для указания признака isFavorite (сердечко).
Этот код везде продублирован.

- [ ] Необходимо этот код (он помечен в коде как ///todo:) отрефакторить в пользу отдельного виджета, который можно будет переиспользовать во всех местах - CocktailGridItem, CocktailTitle.

- [ ] Новый виджет должен поддерживать два состояния - isFavorite, !isFavorite (иконка filled, outline).

- [ ] Иконка должна быть отрисована с использованием графических примитивов - то есть использовать material icons нельзя, работаем через CustomPaint/ClipPath.

- [ ] При нажатии иконка должна увеличиваться на 20 % и возвращаться в исходное состояние.

- [ ] Можно добавить свою физику за счет Curves (ease, elastic, bounce).
