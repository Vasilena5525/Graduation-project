//
//  scanApp.swift
//  Shared
//
//  Created by vasilena stamova on 15/05/2022.
//

import SwiftUI

public struct DarkModeViewModifier: ViewModifier {
@AppStorage("isDarkMode") var isDarkMode: Bool = true
public func body(content: Content) -> some View {
    content
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

@main
struct scanfaceApp: App {
    var network = Network()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modifier(DarkModeViewModifier())
                .environmentObject(network)
        }
    }
}
