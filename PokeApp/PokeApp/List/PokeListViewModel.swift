//
//  PokeListViewModel.swift
//  PokeApp
//
//  Created by Ana Neto on 06/02/2024.
//

import SwiftUI

class PokemonListModel: ObservableObject {
  
  @Published var pokemons: [Pokemon] = []
  var next = PokeAPIClient.baseURL+"?limit=20&offset=0"
  var previous = ""

  @MainActor
  func fetchPokemons(api:PokeAPIClient, fetchMode: FetchMode = .next) {
    Task {
      do {
        let pokemonList = try await api.fetchPokemonList(fetchMode == .next ? self.next : self.previous)
        self.pokemons = pokemonList.results
        self.next = pokemonList.next ?? ""
        self.previous = pokemonList.previous ?? ""

      } catch {
        print("Error fetching Pokemon list: \(error)")
      }
    }
  }

  enum FetchMode {
    case next
    case previous
  }
}
