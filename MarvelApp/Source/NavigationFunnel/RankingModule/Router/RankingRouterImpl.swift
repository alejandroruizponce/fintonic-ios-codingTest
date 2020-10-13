import Foundation

// MARK: - RankingRouterImpl
class RankingRouterImpl {

    var mainRouter: Router

    init(mainRouter: Router) {
        self.mainRouter = mainRouter
    }

}

// MARK: - RankingRouter Protocol
extension RankingRouterImpl: RankingRouter {
    func goToDetailCharacter(with characterDetail: Character) {
        mainRouter.createDetailCharacterView(with: characterDetail)
    }
}
