//
//  PokeAppApp.swift
//  PokeApp
//
//  Created by Ana Neto on 06/02/2024.
//

import SwiftUI

@main
struct PokeAppApp: App {

  let apiClient = PokeAPIClient(session: URLSession.shared, decoder: JSONDecoder())
  var body: some Scene {
    WindowGroup {
      PokeListView()
        .environmentObject(apiClient)
    }
  }
}
