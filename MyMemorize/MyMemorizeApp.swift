//
//  MyMemorizeApp.swift
//  MyMemorize
//
//  Created by Maja on 11/01/2024.
//

import SwiftUI
import SwiftData

@main
struct MyMemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
