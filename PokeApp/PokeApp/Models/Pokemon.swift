//
//  Pokemon.swift
//  PokeApp
//
//  Created by Ana Neto on 06/02/2024.
//

import Foundation

struct Pokemon: Codable, Identifiable, Hashable {
  let id: Int?
  let name: String
  let url: String?
  var weight: Int?
  var height: Int?
  var types: [Types]?
  var moves: [Moves]?
  var abilities: [Abilities]?
  var sprites: Sprites?
}

struct Sprites: Codable, Hashable {
  var front_default: String
}

struct Types: Codable, Hashable {
  var type: Type
}

struct Type: Codable, Hashable {
  var name: String
}

struct Moves: Codable, Hashable {
  var move: Move
}

struct Move: Codable, Hashable {
  var name: String
}

struct Abilities: Codable, Hashable {
  var ability: Ability
}

struct Ability: Codable, Hashable {
  var name: String
}

