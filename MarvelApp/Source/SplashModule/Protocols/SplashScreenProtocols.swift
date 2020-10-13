import Foundation

// MARK: - View
protocol SplashScreenView: class {
    
    var presenter: SplashScreenPresenter? { get set }
    
}

// MARK: - Presenter
protocol SplashScreenPresenter: class {
    
    var view: SplashScreenView? { get set }
    var interactor: SplashScreenInteractor? { get set }
    var router: SplashScreenRouter? { get set }
    
    func goToHomeView()
}


// MARK: - Interactor
protocol SplashScreenInteractorCallback: class {

}

protocol SplashScreenInteractor: class {
    var presenter: SplashScreenInteractorCallback? { get set }

}

// MARK: - Router
protocol SplashScreenRouter: class {
    func goToHomeView()
}
