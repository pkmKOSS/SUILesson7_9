//
//  SettingsView.swift
//  SUILesson7_9
//
//  Created by Григоренко Александр Игоревич on 23.01.2023.
//

import SwiftUI

///  Модель представления экрана с настройками
final class SettingsViewModel: ObservableObject {

    // MARK: - public properties

    @Published var isDarkModeON = true
}

///  Представление экрана с настройками
struct ThemeSettings: View {

    // MARK: - public properties

    @ObservedObject var viewModel: SettingsViewModel
    
    var body: some View {
        HStack {
            Text("Тема -")
            Picker("Тема", selection: $viewModel.isDarkModeON) {
                Text("Темная").tag(true)
                Text("Светлая").tag(false)
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }
}
