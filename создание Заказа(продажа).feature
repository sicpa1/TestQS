﻿#language: ru

@tree

Функционал: создание Заказа

Как Менеджер по продажам я хочу
создание заказа на продажу 
чтобы поставить товар на учет  

Контекст:
Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий:создание Заказа
И В командном интерфейсе я выбираю "Продажи" "Заказ"
Тогда открылось окно "Заказ (создание)"
И из выпадающего списка с именем 'Организация' я выбираю точное значение "ООО \"1000 мелочей\""
И из выпадающего списка с именем 'Покупатель' я выбираю точное значение  "Мосхлеб ОАО"
И из выпадающего списка с именем 'Склад' я выбираю точное значение "Склад отдела продаж"
И в таблице 'Товары' я нажимаю на кнопку с именем 'КомандаПодбор'
Тогда открылось окно "Подбор товара"
И в таблице 'ДеревоТоваров' я разворачиваю текущую строку
И в таблице 'ДеревоТоваров' я перехожу к строке:
	| "Наименование" |
	| "Продукты"     |
И в таблице 'СписокТоваров' я перехожу к строке:
	| "Код"       | "Количество" | "Наименование" | "Цена"   |
	| "000000032" | "1,00"     | "Торт "         | "200,00" |
И в таблице 'СписокТоваров' я выбираю текущую строку
И в таблице 'СписокТоваров' я перехожу к строке:
	| "Код"       | "Наименование" | "Цена"  |
	| "000000029" | "Хлеб"         | "20,00" |
И в таблице 'СписокТоваров' я выбираю текущую строку
И я нажимаю на кнопку с именем 'ОК'
Тогда открылось окно "Заказ (создание) *"

*проверка создания Заказа
И элемент формы с именем 'ВидЦен' стал равен "Оптовая"
И элемент формы с именем 'Организация' стал равен "ООО \"1000 мелочей\""
И элемент формы с именем 'Покупатель' стал равен "Мосхлеб ОАО"
И элемент формы с именем 'Склад' стал равен "Склад отдела продаж"
И элемент формы с именем 'СостояниеЗаказа' стал равен "Открыт"
И таблица 'Товары' стала равной:
	| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'  |
	| 'Торт '  | '200,00' | '1'          | '200,00' |
	| 'Хлеб'  | '20,00'  | '1'          | '20,00'  |

 элемент формы с именем 'ТоварыИтогКоличество' стал равен "2"
И элемент формы с именем 'ТоварыИтогСумма' стал равен "220"
И я нажимаю на кнопку с именем 'ФормаПровести'
И я запоминаю значение поля "Номер" как "Номер"

Сценарий: проверка расчета итогового количества Заказа
И В командном интерфейсе я выбираю "Продажи" "Заказы"
Тогда открылось окно "Заказы товаров"
И в таблице 'Список' я активизирую поле с именем 'Номер'
И в таблице 'Список' я выбираю текущую строку
Тогда открылось окно "Заказ * от *"
И в таблице 'Товары' я активизирую поле с именем 'ТоварыКоличество'
И в таблице 'Товары' я выбираю текущую строку
И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "6"
И в таблице 'Товары' я завершаю редактирование строки
И в таблице 'Товары' я перехожу к строке:
	| "Количество" | "Сумма" | "Товар" | "Цена"  |
	| "1"          | "20,00" | "Хлеб"  | "20,00" |
И в таблице 'Товары' я выбираю текущую строку 
И в таблице 'Товары' в поле с именем 'ТоварыКоличество' я ввожу текст "9"
И в таблице 'Товары' я завершаю редактирование строки
* проверка расчета количества (итог) в Заказе
Тогда таблица 'Товары' стала равной:
	| 'Товар' | 'Цена'   | 'Количество' | 'Сумма'    |
	| 'Торт ' | '200,00' | '6'          | '1 200,00' |
	| 'Хлеб'  | '20,00'  | '9'          | '180,00'   |

И элемент формы с именем 'ТоварыИтогКоличество' стал равен "15"
И элемент формы с именем 'ТоварыИтогСумма' стал равен "1 380"

И я нажимаю на кнопку с именем 'ФормаПровести'