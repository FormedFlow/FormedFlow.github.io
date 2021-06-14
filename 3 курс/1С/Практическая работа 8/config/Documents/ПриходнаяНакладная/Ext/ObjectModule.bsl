﻿
Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр ОстаткиМатериалов Приход
	Движения.ОстаткиМатериалов.Записывать = Истина;
	Для Каждого ТекСтрокаМатериалы Из Материалы Цикл
		Движение = Движения.ОстаткиМатериалов.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.Материал = ТекСтрокаМатериалы.Материал;
		Движение.Склад = Склад;
		Движение.Количество = ТекСтрокаМатериалы.Количество;
	КонецЦикла;

	// регистр Взаимозачеты Расход
	Движения.Взаимозачеты.Записывать = Истина;
	Для Каждого ТекСтрокаМатериалы Из Материалы Цикл
		Движение = Движения.Взаимозачеты.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Контрагент = Поставщик;
		Движение.Сумма = ВсегоПоДокументу;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	// Вставить содержимое обработчика.
	ВсегоПоДокументу=Материалы.Итог("Сумма");	
КонецПроцедуры



