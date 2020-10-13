import Foundation

// MARK: - View
protocol RankingView: class {
    
    var presenter: RankingPresenter? { get set }
    
}

// MARK: - Presenter
protocol RankingPresenter: class {
    
    var view: RankingView? { get set }
    var interactor: RankingInteractor? { get set }
    var router: RankingRouter? { get set }
    
    func clickHeroCell(with characterDetail: Character)

}


// MARK: - Interactor
protocol RankingInteractorCallback: class {

}

protocol RankingInteractor: class {
    var presenter: RankingInteractorCallback? { get set }

}

// MARK: - Router
protocol RankingRouter: class {
    func goToDetailCharacter(with characterDetail: Character)
}
