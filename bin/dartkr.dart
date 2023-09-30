//задание: создать проект на дарте, инициализировать репозиторий,
//изначальное сразу комитим. когда заканчивает делаем снова комит 2 вариант получаем список продуктов
//переменные назвать по смыслу, любую строчку кода объяснить
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  final url = Uri.http('dummyjson.com',
      '/products'); //собираем из переданных строк uri(уникальный идентификатор ресурса)

  final response = await http.get(url); //делаем запрос на http

  Map<String, dynamic> jsonData = convert.jsonDecode(response.body); //преобразовываем json в массив

  List<dynamic> products = jsonData["products"]; //создаем список продуктов

  double sumofallratings = 0.0;

  products.forEach((p) {
    //в forEach передаем функцию, которая считай рейтинг всех продуктов
    var ratingone = p['rating']; //считываем рейтинг одного продукта
    sumofallratings += ratingone; //суммируем
  });

  double average = sumofallratings / products.length; //вычисляем среднее
  print("average rating: $average");
}
