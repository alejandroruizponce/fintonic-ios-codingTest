import Foundation
import UIKit

// MARK: - ArenaPresenterImpl
class ArenaPresenterImpl {
    // MARK: - Properties
    weak var view: ArenaView?
    var interactor: ArenaInteractor?
    var router: ArenaRouter?
}

// MARK: - ArenaPresenter Protocol
extension ArenaPresenterImpl: ArenaPresenter {
    func startFight(with firstFighter: Character, versus secondFighter: Character) {
        if firstFighter.comicsCount > secondFighter.comicsCount {
            view?.showPopUpResult(with: firstFighter)
        } else if secondFighter.comicsCount > firstFighter.comicsCount {
            view?.showPopUpResult(with: secondFighter)
        } 
        UserDefaultsFactory.saveCharactersFight([firstFighter, secondFighter])
    }
    
    func makeRequestsCharactersByName(with name: String, for viewFighter: FightersView) {
        interactor?.getCharactersByName(with: name, for: viewFighter)
    }
    
    func makeRequestInitialCharacters(for viewFighter: FightersView) {
        interactor?.getInitialCharacters(for: viewFighter)
    }
}

// MARK: - ArenaInteractorCallback Protocol
extension ArenaPresenterImpl: ArenaInteractorCallback {
    func setCharactersByNameResult(with characters: [Character], for viewFighter: FightersView) {
        view?.reloadWithCharactersResult(with: characters, for: viewFighter)
     }
     
    func setCharactersResult(with characters: [Character], for viewFighter: FightersView) {
        view?.reloadWithCharactersResult(with: characters, for: viewFighter)
      }
}


