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

  // GETS

  func fetchPokemonList(_ url: String) async throws -> PokemonList {
    return try await request(url: url)
  }

  func fetchPokemonDetail(_ url: String) async throws -> Pokemon {
    return try await request(url: url)
  }

  private func request<T>(url: String) async throws -> T where T: Decodable {
      guard let url = URL(string: url) else { throw URLError(.badURL) }
      let (data, _) = try await session.data(from: url)
      return try decoder.decode(T.self, from: data)
  }

  // POSTS

  func sendPokemonDataToWebhook(pokemon: Pokemon) async throws -> Bool {
      guard let url = URL(string: "https://webhook.site/27cc1b9d-fe9d-4943-b743-b9a10d3bd8e1") else {
          print("Invalid URL")
          return false
      }

      var request = URLRequest(url: url)
      request.httpMethod = "POST"
      request.addValue("application/json", forHTTPHeaderField: "Content-Type")

      do {
          let jsonData = try JSONEncoder().encode(pokemon)
          request.httpBody = jsonData
      } catch {
          print("Error encoding Pokemon data: \(error)")
          return false
      }

      do {
        let (data, _) = try await URLSession.shared.data(for: request)
          if let responseString = String(data: data, encoding: .utf8) {
              print("Webhook response: \(responseString)")
          }
          return true
      } catch {
          print("Error sending Pokemon data: \(error)")
        return false
      }
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

