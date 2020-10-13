import UIKit

// MARK: - ArenaConfigurator
class ArenaConfigurator {

    class func createModule(with tabBar: UITabBarController) -> UIViewController {

        let view = ArenaViewController()
        let interactor: ArenaInteractorImpl = ArenaInteractorImpl()
        let router: ArenaRouterImpl = ArenaRouterImpl(mainRouter: RouterImpl(parentVC: view))
        let presenter: ArenaPresenterImpl = ArenaPresenterImpl()
        let interactorAPI: MarvelAPI = MarvelAPI()
        view.presenter = presenter
        view.tabBar = tabBar
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.dataSource = interactorAPI
        
        return view
    }
   
}
