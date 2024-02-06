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
      VStack {
        ScrollView {
          ForEach(viewModel.pokemons, id: \.self) { pokemon in
            PokeListCell(url: pokemon.url ?? "")
          }
        }
        .safeAreaInset(edge: .bottom) {
          HStack {
            Button {
              viewModel.fetchPokemons(.previous)
            } label: {
              Text("Previous")
            }
            Spacer()
            Button {
              viewModel.fetchPokemons(.next)
            } label: {
              Text("Next")
            }
          }
          .padding()
          .background(Color.white)
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
