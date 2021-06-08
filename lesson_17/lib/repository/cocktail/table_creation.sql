CREATE TABLE Category (id TEXT PRIMARY KEY, value TEXT NOT NULL, name TEXT NOT NULL);

CREATE TABLE GlassType (id TEXT PRIMARY KEY, value TEXT NOT NULL, name TEXT NOT NULL);

CREATE TABLE CocktailType (id TEXT PRIMARY KEY, value TEXT NOT NULL, name TEXT NOT NULL);

CREATE TABLE Cocktail (
                          id TEXT PRIMARY KEY,
                          name TEXT NOT NULL,
                          instruction TEXT NOT NULL,
                          categoryId TEXT NOT NULL,
                          glassTypeId TEXT NOT NULL,
                          cocktailTypeId TEXT NOT NULL,
                          thumbUrl TEXT NOT NULL,
                          isFavourite INTEGER NOT NULL,
                          FOREIGN KEY (categoryId) REFERENCES Category (id),
                          FOREIGN KEY (glassTypeId) REFERENCES GlassType (id),
                          FOREIGN KEY (cocktailTypeId) REFERENCES CocktailType (id)
);

CREATE TABLE Ingredient (id TEXT PRIMARY KEY, ingredientName TEXT NOT NULL, measure TEXT NOT NULL, cocktailId TEXT NOT NULL, FOREIGN KEY (cocktailId) REFERENCES Cocktail (id));

CREATE TABLE Settings (tabIndex INTEGER);

CREATE TABLE CocktailKey (key TEXT PRIMARY KEY, cocktailId TEXT, FOREIGN KEY (cocktailId) REFERENCES Cocktail (id));