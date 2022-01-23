//
//  CharacterViewModel.swift
//  Rick
//
//  Created by Ezequiel Becerra on 23/01/2022.
//

import Combine
import Foundation

class CharacterViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var isRequestFailed = false

    private var currentLastId: Int? = nil

    private var cancellable: AnyCancellable?

    func getCharacters() {
        let lastId = (currentLastId ?? 0) + 1
        cancellable = APIClient().characters(page: lastId)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                guard let self = self else {
                    return
                }

                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                    self.isRequestFailed = true

                case .finished:
                    print("getCharacters - page \(lastId): Finished")
                }
            } receiveValue: { characters in
                self.characters.append(contentsOf: characters)
                self.currentLastId = lastId
            }
    }
}
