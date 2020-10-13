import UIKit
import Foundation

// MARK: - View
protocol ArenaView: class {
    
    var presenter: ArenaPresenter? { get set }
    func reloadWithCharactersResult(with characters: [Character], for viewFighter: FightersView)
    func callPresenterMakeInitialRequest(for viewFighter: FightersView)
    func callPresenterMakeRequestByName(with name: String, for viewFighter: FightersView)
    func setCharacterSelected(from view: FightersView, with character: Character)
    func goToRakingTab()
    func showPopUpResult(with winner: Character)
}

// MARK: - Presenter
protocol ArenaPresenter: class {
    
    var view: ArenaView? { get set }
    var interactor: ArenaInteractor? { get set }
    var router: ArenaRouter? { get set }
    
    func makeRequestInitialCharacters(for viewFighter: FightersView)
    func makeRequestsCharactersByName(with name: String, for viewFighter: FightersView)
    func startFight(with firstFighter: Character, versus secondFighter: Character)

}


// MARK: - Interactor
protocol ArenaInteractorCallback: class {
    func setCharactersResult(with characters: [Character], for viewFighter: FightersView)
    func setCharactersByNameResult(with characters: [Character], for viewFighter: FightersView)
}

protocol ArenaInteractor: class {
    var presenter: ArenaInteractorCallback? { get set }
    func getInitialCharacters(for viewFighter: FightersView)
    func getCharactersByName(with name: String, for viewFighter: FightersView)
}

// MARK: - Router
protocol ArenaRouter: class {

}
