//
//  InfoApp.swift
//  maproadpit
//
//  Created by Дмитрий Лисин on 19.11.2019.
//  Copyright © 2019 Дмитрий Лисин. All rights reserved.
//

import SwiftUI

struct InfoApp: View {
    
    var appVersion: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    }
    var buildVersion: String {
        Bundle.main.infoDictionary?["CFBundleVersion"] as! String
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image("avatar")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
                .cornerRadius(30)
                .shadow(radius: 10)
            Text("Карта ям...")
                .font(.title)
            HStack(spacing: 5) {
                Text("Версия \(appVersion)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Сборка \(buildVersion)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }.padding(.bottom)
            VStack(alignment: .leading) {
                Text("Разработка и дизайн:").bold().font(.caption) + Text(" Дмитрий Лисин").font(.caption)
                Text("Идейный вдохновитель:").bold().font(.caption) + Text(" Жуковский М.С").font(.caption)
            }
            .padding(.horizontal)
                Spacer()
            VStack(alignment: .leading) {
                Button(
                    action: {
                        UIApplication.shared.open(URL(string: "mailto:lisindima1996@gmail.com")!)
                    },
                    label: {
                        HStack {
                            Image(systemName: "envelope")
                            Text("Есть отзыв? Отправьте его по почте.")
                        }
                })
                Button(
                    action: {
                        UIApplication.shared.open(URL(string: "https://testflight.apple.com/join/xE99ppRh")!)
                    },
                    label: {
                        HStack {
                            Image(systemName: "ant")
                            Text("Принять участие в бета-тестирование.")
                        }
                })
            }.padding(.bottom)
            .navigationBarTitle(Text("О приложении"), displayMode: .inline)
        }
    }
}

struct InfoApp_Previews: PreviewProvider {
    static var previews: some View {
        InfoApp()
    }
}
