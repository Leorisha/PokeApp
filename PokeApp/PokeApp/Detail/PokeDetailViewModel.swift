//
//  PokeDetailViewModel.swift
//  PokeApp
//
//  Created by Ana Neto on 07/02/2024.
//

import Foundation

class PokeDetailViewModel: ObservableObject {

  @Published var isSaved: Bool = false

  @MainActor
  func sendPokemonAsFavorite(api:PokeAPIClient, pokemon: Pokemon?) {
    Task {
      do {
        let result = try await api.sendPokemonDataToWebhook(pokemon: pokemon!)
        self.isSaved = result
      } catch {
        print("Error saving Pokemon: \(error)")
      }
    }
  }
}
