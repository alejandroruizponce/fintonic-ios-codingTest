import Foundation

// MARK: - HomeRouterImpl
class HomeRouterImpl {

    var mainRouter: Router

    init(mainRouter: Router) {
        self.mainRouter = mainRouter
    }
}

// MARK: - HomeRouter Protocol
extension HomeRouterImpl: HomeRouter {
    func goToDetailCharacter(with characterDetail: Character) {
        mainRouter.createDetailCharacterView(with: characterDetail)
    }
}
