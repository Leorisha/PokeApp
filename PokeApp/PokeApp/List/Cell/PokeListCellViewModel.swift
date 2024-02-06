//
//  PokeListCellViewModel.swift
//  PokeApp
//
//  Created by Ana Neto on 06/02/2024.
//

import SwiftUI

class PokeListCellViewModel: ObservableObject {
  @Published var pokemon: Pokemon?

  @MainActor
  func fetchPokemonData(api: PokeAPIClient, for url: String? ) {
    Task {
      do {
        let pokemon = try await api.fetchPokemonDetail(url ?? "")
        self.pokemon = pokemon

      } catch {
        print("Error fetching Pokemon Image: \(error)")
      }
    }
  }
}

