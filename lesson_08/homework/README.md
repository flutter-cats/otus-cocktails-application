
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


Архитектура приложения про коктейли, поисковая страничка.
MAIN -> SL Widget (MaterialApp) : Home:
	{
		SF Widget => State
		
		State {
			chosenCategory = CocktailCategory.values.first;
		
		
			поиск: OutlineSearchBar 
			
			Лист категорий: ListView (
				for category in CocktailCategory.values {
					getCategoryItem(
									category.value, 
									categoey == chosenCategory ? true : false, 
									triggerSetState (){
										setState (() =>  chosenCategory = category));
									}
				}),
			Сетка коктейлей: FutureBuilder(
				future: AsyncCocktailRepository().fetchCocktailsByCocktailCategory(chosenCategory),
				builder: (BuildContext context, AsyncSnapshot snapshot) {
					if (snapshot.connectionState == ConnectionState.waiting) => Loading...
					if (snapshot.hasError) => Error...
					if (snapshot.hasData) {
						Iterable<CocktailDefinition> result = snapshot.data;
						Возвращаем GridBuilder, в качестве элемента берем индекс result.elementAt(index)
					}
				}
			)
		}
	}
