import Foundation
import UIKit

// MARK: - ArenaInteractorImpl
class ArenaInteractorImpl {
    // MARK: - Properties
    weak var presenter: ArenaInteractorCallback?
    var dataSource: MarvelAPIProtocol?
}

// MARK: - ArenaInteractor Protocol
extension ArenaInteractorImpl: ArenaInteractor {
    func getInitialCharacters(for viewFighter: FightersView) {
            dataSource?.getCharacters(completion: {
                (data, statusSuccess) in
                if statusSuccess, let dataRes = data {
                    do {
                        let marvelResponse = try JSONDecoder().decode(MarvelAPIResponse.self, from: dataRes)
                        var characters: [Character] = []
                        for character in marvelResponse.data.results {
                            let imageURL = "\(character.thumbnail.path).\(character.thumbnail.extensionThumb)"
     
                            
                            let character = Character(name: character.name,
                                                      description: character.description, image: imageURL,
                                                      comicsCount: character.comics.available)
                            characters.append(character)
                        }
                        self.presenter?.setCharactersResult(with: characters, for: viewFighter)
                    } catch {}
                }
            })
    }
    
    func getCharactersByName(with name: String, for viewFighter: FightersView) {
        dataSource?.getCharactersByName(with: name, completion: {
               (data, statusSuccess) in
               if statusSuccess, let dataRes = data {
                   do {
                       let marvelResponse = try JSONDecoder().decode(MarvelAPIResponse.self, from: dataRes)
                       var characters: [Character] = []
                       for character in marvelResponse.data.results {
                           let imageURL = "\(character.thumbnail.path).\(character.thumbnail.extensionThumb)"

                           
                           let character = Character(name: character.name,
                                                     description: character.description, image: imageURL,
                                                     comicsCount: character.comics.available)
                           characters.append(character)
                       }
                    self.presenter?.setCharactersByNameResult(with: characters, for: viewFighter)
                   } catch {}
               }
           })
    }
}


