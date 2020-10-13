import Foundation

// MARK: - RankingPresenterImpl
class RankingPresenterImpl {
    // MARK: - Properties
    weak var view: RankingView?
    var interactor: RankingInteractor?
    var router: RankingRouter?
}

// MARK: - RankingPresenter Protocol
extension RankingPresenterImpl: RankingPresenter {
    func clickHeroCell(with characterDetail: Character) {
        router?.goToDetailCharacter(with: characterDetail)
    }

}

// MARK: - RankingInteractorCallback Protocol
extension RankingPresenterImpl: RankingInteractorCallback {
 
}


