import Foundation

// MARK: - SplashScreenRouterImpl
class SplashScreenRouterImpl {

    var mainRouter: Router

    init(mainRouter: Router) {
        self.mainRouter = mainRouter
    }

}

// MARK: - SplashScreenRouter Protocol
extension SplashScreenRouterImpl: SplashScreenRouter {
    func goToHomeView() {
        self.mainRouter.createNavigationView()
    }
    
}
