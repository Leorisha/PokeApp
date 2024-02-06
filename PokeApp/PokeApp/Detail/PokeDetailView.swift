//
//  PokeDetailView.swift
//  PokeApp
//
//  Created by Ana Neto on 06/02/2024.
//

import SwiftUI
import Kingfisher

struct PokeDetailView: View {

  var pokemon: Pokemon?

  var body: some View {
    ScrollView{
      KFImage.url(URL(string: pokemon?.sprites?.front_default ?? ""))
        .resizable()
        .scaledToFit()
        .frame(width: 250, height: 250, alignment: .center)

      if let p = pokemon {
        HStack {
          Text("Name: \(p.name)").font(.title)
          Spacer()
        }

        if let weight = p.weight {
          HStack {
            Text("Weight: ").bold()
            Text("\(weight)")
            Spacer()
          }
        }
        if let height = p.height {
          HStack {
            Text("Height: ").bold()
            Text("\(height)")
            Spacer()
          }
        }
        if let types = p.types {
          HStack {
            Text("Types: ").bold()
            Text("\(types.map { $0.type.name }.joined(separator: ", "))")
            Spacer()
          }
        }
        if let abilities = p.abilities {
          HStack {
            Text("Abilities: ").bold()
            Text("\(abilities.map { $0.ability.name }.joined(separator: ", "))")
            Spacer()
          }
        }
        if let moves = p.moves {
          HStack {
            Text("Moves: ").bold()
            Text("\(moves.map { $0.move.name }.joined(separator: ", "))")
            Spacer()
          }
        }
        Spacer()
      }
    }
  }
}
