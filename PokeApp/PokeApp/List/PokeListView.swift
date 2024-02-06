//
//  ContentView.swift
//  PokeApp
//
//  Created by Ana Neto on 06/02/2024.
//

import SwiftUI

struct PokeListView: View {
  @ObservedObject var viewModel: PokemonListModel = PokemonListModel()

  var body: some View {
    NavigationView {
      ScrollView {
        ForEach(viewModel.pokemons, id: \.self) { pokemon in
          PokeListCell(url: pokemon.url ?? "")
        }
      }
      .navigationBarTitle("Pokemons")
    }
    .onAppear() {
      viewModel.fetchPokemons()
    }
  }
}

struct PokemonListView_Previews: PreviewProvider {
  static var previews: some View {
    PokeListView()
  }
}
