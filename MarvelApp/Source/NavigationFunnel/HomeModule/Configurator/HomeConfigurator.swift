import UIKit

// MARK: - HomeConfigurator
class HomeConfigurator {

    class func createModule() -> UIViewController {
        let view = HomeViewController()
        let interactor: HomeInteractorImpl = HomeInteractorImpl()
        let router: HomeRouterImpl = HomeRouterImpl(mainRouter: RouterImpl(parentVC: view))
        let presenter: HomePresenterImpl = HomePresenterImpl()
        let interactorAPI: MarvelAPI = MarvelAPI()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.dataSource = interactorAPI
        
        return view
    }
   
}
