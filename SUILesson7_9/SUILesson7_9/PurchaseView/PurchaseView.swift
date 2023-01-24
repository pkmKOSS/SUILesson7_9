//
//  PuchaaseView.swift
//  SUILesson7_9
//
//  Created by Григоренко Александр Игоревич on 23.01.2023.
//

import SwiftUI

/// Представление экрана с тарифными планами.
struct PurchaseView: View {

    // MARK: - private constants

    private enum Constants {
        static let titleName = "Privacy Matters"
        static let subTitleName = "Protect your online activities with VPN Plus"
        static let defaultBottomOffset: EdgeInsets = EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0)
        static let imageSize: CGFloat = 120
        static let imageScaleCoef: CGFloat = 1.4
        static let zeroOffset: CGFloat = 0
        static let thirtyOffset: CGFloat = 30
        static let selectedIndex = 2
        static let buyName = "Buy"
        static let eightySize: CGFloat = 80
        static let fourtySize: CGFloat = 40
    }

    // MARK: - public properties

    var body: some View {
        VStack {
            VStack {
                Text(Constants.titleName)
                    .font(.title)
                    .padding(Constants.defaultBottomOffset)
                Text(Constants.subTitleName)
            }
            VStack {
                ScrollView {
                    VStack {
                        ForEach(0..<tariffsLine.tarrifs.count) {
                            let tariff = tariffsLine.tarrifs[$0]
                            VStack {
                                tarrifImageView(tariff: tariff)
                                vacationTarrifTextView(tariff: tariff)
                                buyButtonView(tariff: tariff)
                            }
                        }
                    }
                }
                .padding(EdgeInsets(top: Constants.thirtyOffset, leading: Constants.zeroOffset, bottom: Constants.zeroOffset, trailing: Constants.zeroOffset))
            }
        }
    }

    // MARK: - private properties

    @Binding private var selected: Int
    @Binding private var tarif: Tariff

    // MARK: - private properties

    private let tariffsLine = TarrifsLine()
    private func tarrifImageView(tariff: Tariff) -> some View {
        Image(tariff.imageName)
            .frame(width: Constants.imageSize,  height: Constants.imageSize)
            .scaleEffect(x: Constants.imageScaleCoef, y: Constants.imageScaleCoef)
            .padding(Constants.defaultBottomOffset)
    }
    private func vacationTarrifTextView(tariff: Tariff) -> some View {
        Text("Vacation (\(tariff.countOfDays) days) \(tariff.cost) RUB")
            .padding(Constants.defaultBottomOffset)
    }
    private func buyButtonView(tariff: Tariff) -> some View {
        Button {
            self.selected = Constants.selectedIndex
            self.tarif = tariff
        } label: {
            Text(Constants.buyName)
        }
        .frame(width: Constants.eightySize, height: Constants.fourtySize)
        .background(Color.blue)
        .foregroundColor(.white)
    }
}
