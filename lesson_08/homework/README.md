
// TODO: Сделать экран Фильтр по категории
// Ссылка на макет: https://www.figma.com/file/Uzn5jHYiiFgacPCWNhwbc5/%D0%9A%D0%BE%D0%BA%D1%82%D0%B5%D0%B9%D0%BB%D0%B8-Copy?node-id=20%3A590

// 1. Фильты - это CocktailCategory, получить все значения можно через CocktailCategory.values
// 2. Поиск по фильтру делаем через AsyncCocktailRepository().fetchCocktailsByCocktailCategory(CocktailCategory)
// 3. Используем StreamBuilder/FutureBuilder
// 4. По нажатию на категорию на странице должны обновится список коктейлей. Выбранная категория подсвечивается как в дизайне. По умолчанию выбрана первая категория.
// 5. Поиск по названию пока что не делаем!
// 6. Должны отображаться ошибки и состояние загрузки.
// 7. Для скролла используем CustomScrollView
// 8. Делаем fork от репозитория и сдаем через PR
// 9. Помним про декомпозицию кода по методам и классам.

Скриншоты приложения:
![Screenshot_1646755496](https://user-images.githubusercontent.com/3978824/157278242-4c8dda3e-1656-470b-98d2-657a258c26a6.png)
![Screenshot_1646755504](https://user-images.githubusercontent.com/3978824/157278251-3cda4266-7e1a-43b4-93a0-5d367d611972.png)
![Screenshot_1646755507](https://user-images.githubusercontent.com/3978824/157278262-05cba087-3ce8-4902-ad25-506721e85821.png)
![Screenshot_1646755521](https://user-images.githubusercontent.com/3978824/157278268-75d210b4-3342-4b89-b529-3e2f6f2afacf.png)
