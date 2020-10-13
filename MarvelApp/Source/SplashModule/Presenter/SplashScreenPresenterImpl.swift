import Foundation

// MARK: - SplashScreenPresenterImpl
class SplashScreenPresenterImpl {
    // MARK: - Properties
    weak var view: SplashScreenView?
    var interactor: SplashScreenInteractor?
    var router: SplashScreenRouter?
}

// MARK: - SplashScreenPresenter Protocol
extension SplashScreenPresenterImpl: SplashScreenPresenter {
    func goToHomeView() {
        router?.goToHomeView()
    }
}

// MARK: - SplashScreenInteractorCallback Protocol
extension SplashScreenPresenterImpl: SplashScreenInteractorCallback {
 
}


