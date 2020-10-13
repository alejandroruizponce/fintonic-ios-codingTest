import Foundation

// MARK: - ArenaRouter Protocol
class ArenaRouterImpl {

    var mainRouter: Router

    init(mainRouter: Router) {
        self.mainRouter = mainRouter
    }

}

// MARK: - ArenaRouter Protocol
extension ArenaRouterImpl: ArenaRouter {

}
