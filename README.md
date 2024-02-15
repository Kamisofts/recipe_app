# recipe_app

# Description
A demo app that demonstrates Flutter's ability to create beautiful UI with complex animations.
The app fetches recipes from local storage.

## 📦 Packages
Clean Architecture
Flutter BLoC

## Screenshot 📸


https://github.com/Dev-Salem/dribbble_recipe_challenge/assets/108498811/b276696e-aafe-40e4-8134-b53991e654d6



## 🩻 Project Structure

```
|- assets <- recipe.json and images
|
lib
|
|__ 📁core
|	|__ 📁constants <- all constants values
|	|__ 📁theme <- define themes
|	|__ 📁utils 
|	|__ 📁widgets <- widgets that are used in multiple screens
|	
|
|_ 📁features
	|
	|__ 📁on_boarding 
    |   |__ 📁presentation <- On Boarding Screen and related widgets
    |
	|__ 📁recipes 
        	|__ 📁domain <- entities
		    |__ 📁data <- recipe repository (fetch recipes from recipe.json)
        	|__ 📁presentation <- Recipe Bloc, Home Screen & Recipe Details Screen and other related widgets
```


## 💭 Inspiration

Dribbble: https://dribbble.com/shots/19973273-Recipe-Mobile-IOS-App

## 🗞️ License
MIT License

