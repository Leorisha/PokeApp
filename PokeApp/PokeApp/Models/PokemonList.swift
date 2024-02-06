//
//  PokemonListResponse.swift
//  PokeApp
//
//  Created by Ana Neto on 06/02/2024.
//

import Foundation

struct PokemonList: Codable {
    let next: String?
    let previous: String?
    let count: Int
    let results: [Pokemon]
}

