//
//  PokeAPIClient.swift
//  PokeApp
//
//  Created by Ana Neto on 06/02/2024.
//

import Foundation
import SwiftUI

struct PokeAPIClient {

  static var baseURL: String = "https://pokeapi.co/api/v2/pokemon"

  func fetchPokemonList(_ url: String) async throws -> PokemonList {
    guard let url = URL(string: url) else { throw URLError(.badURL) }

    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = try JSONDecoder().decode(PokemonList.self, from: data)
      return decoder
    } catch {
      throw error
    }
  }

  func fetchPokemonDetail(_ url: String) async throws -> Pokemon {
    guard let url = URL(string: url) else { throw URLError(.badURL) }

    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      let decoder = try JSONDecoder().decode(Pokemon.self, from: data)
      return decoder
    } catch {
      throw error
    }
  }
}
