import Foundation

// MARK: - HomePresenterImpl
class HomePresenterImpl {
    // MARK: - Properties
    weak var view: HomeView?
    var interactor: HomeInteractor?
    var router: HomeRouter?
}

// MARK: - HomePresenter Protocol
extension HomePresenterImpl: HomePresenter {
    func makeRequestsCharactersByName(with name: String) {
        interactor?.getCharactersByName(with: name)
    }
    
    func makeRequestInitialCharacters() {
        interactor?.getInitialCharacters()
    }
    
    func clickHeroCell(with characterDetail: Character) {
        router?.goToDetailCharacter(with: characterDetail)
    }
    
}

// MARK: - HomeInteractorCallback Protocol
extension HomePresenterImpl: HomeInteractorCallback {
    func setCharactersByNameResult(with characters: [Character]) {
        view?.reloadWithCharactersResult(with: characters)
    }
    
    func setCharactersResult(with characters: [Character]) {
        view?.reloadWithCharactersResult(with: characters)
     }
    
    
}


