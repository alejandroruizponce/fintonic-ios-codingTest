import Foundation

// MARK: - HomeConfigurator
class HomeInteractorImpl {
    
    // MARK: - Properties
    weak var presenter: HomeInteractorCallback?
    var dataSource: MarvelAPIProtocol?
}

// MARK: - HomeInteractor Protocol
extension HomeInteractorImpl: HomeInteractor {
    func getInitialCharacters() {
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
                        self.presenter?.setCharactersResult(with: characters)
                        
                    } catch {}
                }
            })
    }
    
    func getCharactersByName(with name: String) {
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
                       self.presenter?.setCharactersByNameResult(with: characters)
                   } catch {}
               }
           })
    }
    
}
