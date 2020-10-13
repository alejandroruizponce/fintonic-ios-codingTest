import Foundation
import UIKit


class AppModules {
    
    class func createMainModule() -> UIViewController {
        return createSplashModule()
    }
    
    // MARK: - Splash Screen
    class func createSplashModule() -> UIViewController {
         return SplashScreenConfigurator.createModule()
    }
    
    // MARK: - Navigation Menu
    class func createNavigationMenu() -> UIViewController {
         return NavViewController()
    }
    
    // MARK: - Home View
    class func createHomeModule() -> UIViewController {
        return HomeConfigurator.createModule()
    }
    
    // MARK: - Detail Character View
    class func createDetailCharacterView(with characterDetail: Character) -> UIViewController {
        let vc = HeroDetailViewController()
        vc.character = characterDetail
        return vc
    }
    
    // MARK: - Arena View
    class func createArenaModule(with tabBar: UITabBarController) -> UIViewController {
        return ArenaConfigurator.createModule(with: tabBar)
    }
    
    // MARK: - Ranking View
    class func createRankingModule() -> UIViewController {
        return RankingConfigurator.createModule()
    }



}
