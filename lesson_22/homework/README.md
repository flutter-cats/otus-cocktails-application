# Домашняя работа к заданию 24. Обзор специфика платформ Android, iOS. Взаимодействие с нативным кодом. Share plugin

Скриншоты:

[share.png](share.png)

[random.png](random.png)



[V] Склонировать соотвествующий github репозиторий с заготовкой проекта для этого урока (https://github.com/guid-empty/otus-cocktail-app-lessons)

[V] Подключить соот-щий плагинг для вызова platform's share dialog в pubspec.yaml

[V] Открыть класс экрана CocktailDetailPage -> виджет CocktailPreview с кнопкой Share

[V] Внести изменения в код обработчика событий на нажатие кнопки Share (Поделиться) (в виджете CocktailPreview)

[V] В обработчике события на Sharing сформировать текст с ссылкой на ImageThumb для описания коктейля

[V] В обработчике события на Sharing выполнить обращение к классу плагина и пошарить описание коктейля

[V] Убедиться, что сформированный текст уходит в канал #random в нашем канале Slack


На усмотрение студента:

[V] Можно использовать любые проверенные плагины из pub.dev - share_plus

[V] Можно выполнить любую декомпозицию методов экрана CocktailDetailPage (а также в виджете CocktailPreview) или кнопки Share для внесения изменений, требуемых для sharing

                  

# ВАЖНО! Использованиев share_plus

При использовании плагина share_plus использовать версию 3.0.5 и ниже, в противном случае ошибка
```dependencies:
  share_plus: 3.0.5```

Получаемая ошибка при использовании версий 3.1.0 (и все 4.х.х) и выше
  
```
FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:processDebugResources'.
> A failure occurred while executing com.android.build.gradle.internal.tasks.Workers$ActionFacade
   > Android resource linking failed
     .gradle\caches\transforms-2\files-2.1\574d96996a78f48619a014c868c26e7e\core-1.7.0\res\values\values.xml:105:5-114:25: AAPT: error: resource android:attr/lStar not found.
```