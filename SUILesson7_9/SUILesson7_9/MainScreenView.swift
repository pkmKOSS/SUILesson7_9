//
//  ContentView.swift
//  SUILesson7_9
//
//  Created by Григоренко Александр Игоревич on 23.01.2023.
//

import SwiftUI

/// Представление навигации.
struct TapView: View {

    // MARK: - private constants

    private enum Constants {
        static let lockImageName = "lock"
        static let lineImageName = "line.3.horizontal"
        static let basketImageName = "basket"
        static let themeImageName = "cloud.sun.fill"
        static let vpnName = "VPN"
        static let purchapseName = "Purchapse"
        static let basketName = "Basket"
        static let themeName = "Theme"
        static let vpnTag = 0
        static let purchapseTag = 1
        static let basketTag = 2
        static let themeTag = 3
    }

    // MARK: - public propertie

    var body: some View {
        TabView(selection: $selected) {
            StartVPNview()
                .tabItem {
                    Image(systemName: Constants.lockImageName)
                    Text(Constants.vpnName)
                }.tag(Constants.vpnTag)
            PurchaseView(selected: $selected, tarif: $tarif)
                .tabItem {
                    Image(systemName: Constants.lineImageName)
                    Text(Constants.purchapseName)
                }.tag(Constants.purchapseTag)
            BasketView(tariff: $tarif)
                .tabItem {
                    Image(systemName: Constants.basketImageName)
                    Text(Constants.basketImageName)
                }.tag(Constants.basketTag)
            ThemeSettings(viewModel: settingsViewModel)
                .tabItem {
                    Image(systemName: Constants.themeImageName)
                    Text(Constants.themeName)
                }.tag(Constants.themeImageName)
        }.environment(\.colorScheme, settingsViewModel.isDarkModeON ? .dark : .light)
    }

    // MARK: - private properties

    @ObservedObject private var settingsViewModel = SettingsViewModel()
    @State private var selected = 0
    @State private var tarif: Tariff? = nil
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TapView()
    }
}
