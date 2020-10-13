import UIKit

// MARK: - RankingConfigurator
class RankingConfigurator {

    class func createModule() -> UIViewController {
        let view = RankingViewController()
        let interactor: RankingInteractorImpl = RankingInteractorImpl()
        let router: RankingRouterImpl = RankingRouterImpl(mainRouter: RouterImpl(parentVC: view))
        let presenter: RankingPresenterImpl = RankingPresenterImpl()
        view.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
   
}
