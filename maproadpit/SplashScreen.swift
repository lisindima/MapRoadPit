//
//  SplashScreen.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 25.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI

struct SplashScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            TitleView()
            InformationContainerView()
            Spacer(minLength: 30)
            Button(action: {
                let generator = UINotificationFeedbackGenerator()
                generator.notificationOccurred(.success)
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Продолжить")
                    .customButton()
            }
            .padding(.horizontal)
        }
    }
}

struct InformationContainerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            InformationDetailView(title: "Автоматически", subTitle: "Определение неровностей на дороге происходит автоматически.", imageName: "car")
            InformationDetailView(title: "Карта", subTitle: "Просмотр на карте самых проблемных участков дорог в городе.", imageName: "map")
            InformationDetailView(title: "Навигация", subTitle: "Прогладывания маршрута с учетом повреждения дорожного полотна.", imageName: "location")
        }
        .padding(.horizontal)
    }
}

struct InformationDetailView: View {
    
    var title: String = "title"
    var subTitle: String = "subTitle"
    var imageName: String = "car"

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: imageName)
                .font(.largeTitle)
                .foregroundColor(.mainColor)
                .padding()
                .accessibility(hidden: true)
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .accessibility(addTraits: .isHeader)
                Text(subTitle)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(.top)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, alignment: .center)
                .accessibility(hidden: true)
                .cornerRadius(30)
                .shadow(radius: 10)
            Text("Карта")
                .customTitleText()
            Text("ЯМ")
                .customTitleText()
                .foregroundColor(.mainColor)
        }
    }
}


struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.mainColor))
            .padding(.bottom)
    }
}

extension View {
    func customButton() -> ModifiedContent<Self, ButtonModifier> {
        return modifier(ButtonModifier())
    }
}

extension Text {
    func customTitleText() -> Text {
        self
            .fontWeight(.black)
            .font(.system(size: 36))
    }
}

extension Color {
    static var mainColor = Color(UIColor.systemIndigo)
}
