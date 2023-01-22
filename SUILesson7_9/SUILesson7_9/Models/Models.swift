//
//  Models.swift
//  SUILesson7_9
//
//  Created by Григоренко Александр Игоревич on 23.01.2023.
//

import Foundation

/// Модель тарифного плана
struct Tariff {
    /// Количество дней
    let countOfDays: Int
    /// Цена тарифа
    let cost: Int
    /// Имя изображения
    let imageName: String
}

/// Модель сборника тарифных планов
struct TarrifsLine {
    /// Массив с тарифнфми планами
    let tarrifs = [
        Tariff(countOfDays: 1, cost: 50, imageName: "1day"),
        Tariff(countOfDays: 7, cost: 99, imageName: "7days"),
        Tariff(countOfDays: 21, cost: 160, imageName: "21days"),
        Tariff(countOfDays: 30, cost: 190, imageName: "30days")
    ]
}
