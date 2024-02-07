//
//  PokeAPIClient.swift
//  PokeApp
//
//  Created by Ana Neto on 06/02/2024.
//

import Foundation
import SwiftUI

class PokeAPIClient: ObservableObject {

  static var baseURL: String = "https://pokeapi.co/api/v2/pokemon"

  let session: URLSession
  let decoder: JSONDecoder

  init(session: URLSession, decoder: JSONDecoder) {
      self.session = session
      self.decoder = decoder
  }

  private func request<T>(url: String) async throws -> T where T: Decodable {
      guard let url = URL(string: url) else { throw URLError(.badURL) }
      let (data, _) = try await session.data(from: url)
      return try decoder.decode(T.self, from: data)
  }
  func fetchPokemonList(_ url: String) async throws -> PokemonList {
    return try await request(url: url)
  }

  func fetchPokemonDetail(_ url: String) async throws -> Pokemon {
    return try await request(url: url)
  }
}

private struct PokeAPIClientKey: EnvironmentKey {
  static let defaultValue: PokeAPIClient = PokeAPIClient(session: URLSession.shared, decoder: JSONDecoder())
}

extension EnvironmentValues {
    var pokeAPIClient: PokeAPIClient {
        get { self[PokeAPIClientKey.self] }
        set { self[PokeAPIClientKey.self] = newValue }
    }
}

