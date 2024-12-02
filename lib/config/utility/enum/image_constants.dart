enum ImageConstants {
  background("bg"),
  home("Home"),
  buy("Buy"),
  icons("icons"),
  search("search"),
  login("login"),
  google("google"),
  facebook("facebook"),
  voice("voice"),
  options("options"),
  location("location"),
  down("down"),
  burger("burger"),
  pizza("pizza"),
  popcorn("popcorn"),
  right("right"),
  foodPizza("food_pizza"),
  foodBurger("food_burger"),
  pizzaLarge("pizza_large"),
  timeCircle("time"),
  fire("fire"),
  star("star"),
  basket("basket"),
  backButton("back_button"),
  ;

  final String value;
  const ImageConstants(this.value);

  String get getPng => 'assets/img/$value.png';
  String get getSvg => 'assets/svg/$value.svg';
}
