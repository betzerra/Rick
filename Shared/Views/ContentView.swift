//
//  ContentView.swift
//  Shared
//
//  Created by Ezequiel Becerra on 23/01/2022.
//

import Combine
import SwiftUI

struct ContentView: View {

    @ObservedObject var characterViewModel = CharacterViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(characterViewModel.characters, id:\.id) { item in
                    CharacterRow(character: item)
                }

                LoaderView(isFailed: characterViewModel.isRequestFailed)
                    .onAppear(perform: fetchData)
                    .onTapGesture(perform: onTapLoadView)
            }
            .navigationTitle("Characters")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .onAppear {
            characterViewModel.getCharacters()
        }.navigationViewStyle(StackNavigationViewStyle())
    }

    private func fetchData() {
        characterViewModel.getCharacters()
    }

    private func onTapLoadView() {
        if characterViewModel.isRequestFailed {
            characterViewModel.isRequestFailed = false
            fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
