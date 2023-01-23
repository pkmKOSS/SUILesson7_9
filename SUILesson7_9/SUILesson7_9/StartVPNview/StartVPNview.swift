//
//  StartVPNview.swift
//  SUILesson7_9
//
//  Created by Григоренко Александр Игоревич on 23.01.2023.
//

import SwiftUI

/// Представление экрана с VPN
struct StartVPNview: View {

    // MARK: - private constants

    private enum Constants {
        static let emptyString = ""
        static let ipAddressName = "IP Address"
        static let ipAdressValue = "127.0.0.1"
        static let receivedName = "Received"
        static let receivedValue = "0 MB"
        static let sentName = "Sent"
        static let vpnToggleScale: CGFloat = 2
        static let vpnFrameWidth: CGFloat = 50
        static let vpnFrameHeight: CGFloat = 50
        static let infoAboutConnectionHorizontalOffset: CGFloat = 70
        static let infoAboutConnectionVerticalOffset: CGFloat = 50
        static let infoAboutConnectionBottomOffset: CGFloat = 5
        static let zeroOffcet: CGFloat = 0
        static let bottomOffset: CGFloat = 150
        static let messageAboutCountOFDaysName = "Service will expire after 15 days"
    }

    // MARK: - public properties

    var body: some View {
        VStack {
            VPNflagAndToggle()
            vpnToggleView
            connectionInfoView
            messageAboutCountOfDaysView
        }
    }

    // MARK: - private properties

    @State private var isVPNon = false

    private var vpnToggleView: some View {
        Toggle(Constants.emptyString, isOn: $isVPNon)
            .scaleEffect(x: Constants.vpnToggleScale, y:  Constants.vpnToggleScale)
            .frame(width: Constants.vpnFrameWidth, height: Constants.vpnFrameHeight, alignment: .center)
            .padding(
                EdgeInsets(
                    top: Constants.infoAboutConnectionVerticalOffset,
                    leading: Constants.zeroOffcet,
                    bottom: Constants.zeroOffcet,
                    trailing: Constants.zeroOffcet
                )
            )
    }

    private var connectionInfoView: some View {
        VStack {
            HStack {
                Text(Constants.ipAddressName)
                Spacer()
                Text(Constants.ipAdressValue)
            }.padding(
                EdgeInsets(
                    top: Constants.zeroOffcet,
                    leading: Constants.infoAboutConnectionHorizontalOffset,
                    bottom: Constants.infoAboutConnectionBottomOffset,
                    trailing: Constants.infoAboutConnectionHorizontalOffset
                )
            )
            HStack {
                Text(Constants.receivedName)
                Spacer()
                Text(Constants.receivedValue)
            }.padding(
                EdgeInsets(
                    top: Constants.zeroOffcet,
                    leading: Constants.infoAboutConnectionHorizontalOffset,
                    bottom: Constants.infoAboutConnectionBottomOffset,
                    trailing: Constants.infoAboutConnectionHorizontalOffset
                )
            )
            HStack {
                Text(Constants.sentName)
                Spacer()
                Text(Constants.receivedValue)
            }.padding(
                EdgeInsets(
                    top: Constants.zeroOffcet,
                    leading: Constants.infoAboutConnectionHorizontalOffset,
                    bottom: Constants.zeroOffcet,
                    trailing: Constants.infoAboutConnectionHorizontalOffset
                )
            )
        }.padding(
            EdgeInsets(
                top: Constants.infoAboutConnectionVerticalOffset,
                leading: Constants.zeroOffcet,
                bottom: Constants.bottomOffset,
                trailing: Constants.zeroOffcet
            )
        )
    }

    private var messageAboutCountOfDaysView: some View {
        Text(Constants.messageAboutCountOFDaysName)
    }
}

/// Представление экрана с тоглом ВПН
struct VPNflagAndToggle: View {

    // MARK: - public properties

    var body: some View {
        Image(Constants.vpnImageName)
            .resizable()
            .frame(width: Constants.vpnImageSize, height: Constants.vpnImageSize)
            .scaleEffect(x: Constants.imageScaleCoef , y: Constants.imageScaleCoef)
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(Constants.vpnCornerRadius)
    }

    // MARK: - private constants

    private enum Constants {
        static let vpnImageName = "flag"
        static let vpnImageSize: CGFloat = 230
        static let vpnScaleEffectCoef: CGFloat = 10
        static let vpnCornerRadius: CGFloat = 122
        static let imageScaleCoef: CGFloat = 0.85
    }
}
