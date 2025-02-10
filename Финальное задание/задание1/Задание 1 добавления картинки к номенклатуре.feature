﻿#language: ru

@tree

Функционал: Прикрепления файла картинки в Товаре

Как Тестировщик я хочу
хочу протестировать прикрепление файлов к товарам 
чтобы пользователи смоги воспользоваться данной доработкой 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий


Сценарий:  Прикрепление файла картинки
	И я закрываю все окна клиентского приложения
	Дано Я открываю навигационную ссылку "e1cib/list/Справочник.Товары"
	И в таблице "Список" я перехожу к строке
		| 'Наименование' |
		| 'Bosch1234'    |
	И в таблице 'Список' я выбираю текущую строку
	Когда открылось окно "Bosch1234 (Товар)"
	И я нажимаю кнопку выбора у поля с именем 'ФайлКартинки'
	Тогда открылось окно "Файлы"
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно "Файл (создание)"
	И в поле с именем 'Наименование' я ввожу текст "Новая"
	И я выбираю файл "C:\Users\User\Documents\TestQS\TestQS\Features_IRP\Files\itempicture2.png"
	И я нажимаю на кнопку с именем 'ВыбратьФайлСДискаИЗаписать'	
	И Пауза 10
	Тогда элемент формы с именем 'ИмяФайла' стал равен "itempicture2.png"	
	И я нажимаю на кнопку с именем 'ФормаЗаписатьИЗакрыть'
	И я жду закрытия окна "Новая (Файл)" в течение 20 секунд
	Тогда открылось окно "Файлы"
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно "Bosch1234 (Товар) *"
	И я нажимаю на кнопку с именем 'ОбновитьКартинку'
	Тогда элемент формы с именем 'ФайлКартинки' стал равен "Новая"