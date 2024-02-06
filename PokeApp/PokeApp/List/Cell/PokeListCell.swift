//
//  PokeListCell.swift
//  PokeApp
//
//  Created by Ana Neto on 06/02/2024.
//

import SwiftUI
import Kingfisher

struct PokeListCell: View {
  @ObservedObject var viewModel: PokeListCellViewModel = PokeListCellViewModel()
  var url: String?

  var body: some View {
    NavigationLink(destination: PokeDetailView(pokemon: viewModel.pokemon)) {
      HStack {
        KFImage.url(URL(string: viewModel.pokemon?.sprites?.front_default ?? ""))
          .resizable()
          .scaledToFit()
          .frame(width: 100, height: 100, alignment: .center)

        Text(viewModel.pokemon?.name.capitalized ?? "")
        Spacer()
      }
      .onAppear {
        viewModel.fetchPokemonData(for: url)
      }
    }
  }
}
