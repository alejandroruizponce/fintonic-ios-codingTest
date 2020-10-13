import Foundation

// MARK: - View
protocol HomeView: class {
    
    var presenter: HomePresenter? { get set }
    
    func reloadWithCharactersResult(with characters: [Character])
    
}

// MARK: - Presenter
protocol HomePresenter: class {
    
    var view: HomeView? { get set }
    var interactor: HomeInteractor? { get set }
    var router: HomeRouter? { get set }

    func makeRequestInitialCharacters()
    func makeRequestsCharactersByName(with name: String)
    func clickHeroCell(with characterDetail: Character)

}


// MARK: - Interactor
protocol HomeInteractorCallback: class {
    func setCharactersResult(with characters: [Character])
    func setCharactersByNameResult(with characters: [Character])
}

protocol HomeInteractor: class {
    var presenter: HomeInteractorCallback? { get set }
    var dataSource: MarvelAPIProtocol? { get set }
    
    func getInitialCharacters()
    func getCharactersByName(with name: String)
    
    

}

// MARK: - Router
protocol HomeRouter: class {
    func goToDetailCharacter(with characterDetail: Character)
}
