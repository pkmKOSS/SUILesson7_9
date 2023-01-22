//
//  BasketView.swift
//  SUILesson7_9
//
//  Created by Григоренко Александр Игоревич on 23.01.2023.
//

import SwiftUI

/// Представление экрана с корзиной
struct BasketView: View {

    // MARK: - private constants

    private enum Constants {
        static let titleName = "Корзина"
        static let tarifForName = "Тариф на"
        static let daysName = "дней"
        static let priceName = "Цена:"
        static let rubName = "руб."
        static let basketIsEmptyName = "Корзина пуста"
        static let buyName = "Купить"
        static let successBuyingName = "Покупка совершена"
        static let defaultWidth: CGFloat = 150
        static let defaultHeight: CGFloat = 40
    }

    // MARK: - public properites
    
    @Binding var tariff: Tariff?

    var body: some View {
        VStack {
            Text(Constants.titleName).font(.largeTitle)
            VStack {

                HStack {
                    if let tariff = tariff {
                        Text("\(Constants.tarifForName) \(tariff.countOfDays) \(Constants.daysName)")
                            .font(.headline)
                            .padding()
                        Spacer()
                        Text("\(Constants.priceName) \(tariff.cost) \(Constants.rubName)")
                            .font(.headline)
                            .padding()

                    } else {
                        Text(Constants.basketIsEmptyName)
                    }
                }
                
                Button {
                    self.isAlertShown.toggle()
                } label: {
                    Text(Constants.buyName)
                }.frame(width: Constants.defaultWidth, height: Constants.defaultHeight)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .alert(Constants.successBuyingName, isPresented: $isAlertShown) {
                        Text(Constants.successBuyingName)
                    }
            }
        }
    }

    // MARK: - private properties

    @State private var title = "Title"
    @State private var isAlertShown = false
}
