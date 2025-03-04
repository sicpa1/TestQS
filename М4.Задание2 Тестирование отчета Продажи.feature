﻿#language: ru

@tree

Функционал: Тестирование отчета Продажи

Как Тестировщик я хочу
протестировать возвраты в отчете Продажи
чтобы убедиться в корректности отчета

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: _0101 Подготовительный сценарий (тестирование отчета Продажи)
	Когда экспорт основных данных
	Когда экспорт документов продаж
	И я выполняю код встроенного языка на сервере
		|'Документы.SalesOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesReturnOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|
		|'Документы.GoodsReceipt.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);'|

Сценарий: _0102 Проверка отчета о продажах с возвратами
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю "Отчеты" "D2001 Продажи"
	Тогда открылось окно "D2001 Продажи"
	И я нажимаю на кнопку с именем 'FormGenerate'
	Тогда табличный документ 'Result' равен:
		| 'Параметры:'               | 'Период: 01.01.2025 - 31.01.2025'                                   | ''        | ''                  | ''             |
		| 'Отбор:'                   | 'Вид мультивалютной аналитики Равно "ru наименование не заполнено"' | ''        | ''                  | ''             |
		| ''                         | ''                                                                  | ''        | ''                  | ''             |
		| 'Период, месяц'            | 'Итого'                                                             | ''        | ''                  | ''             |
		| 'Номенклатура'             | ''                                                                  | ''        | ''                  | ''             |
		| 'Характеристика'           | 'Количество'                                                        | 'Сумма'   | 'Сумма без налогов' | 'Сумма скидки' |
		| 'Март 2021'                | '-1,000'                                                            | '-190,00' | '-158,33'           | ''             |
		| 'Товар с характеристиками' | '-1,000'                                                            | '-190,00' | '-158,33'           | ''             |
		| 'S/Красный'                | '-1,000'                                                            | '-190,00' | '-158,33'           | ''             |
		| 'Итого'                    | '-1,000'                                                            | '-190,00' | '-158,33'           | ''             |
	
		
