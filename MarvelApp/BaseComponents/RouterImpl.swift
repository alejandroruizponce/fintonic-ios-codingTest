import UIKit
import Foundation
import SwiftPopup

class RouterImpl: Router {
    
    weak var parentVC: UIViewController?

    init(parentVC: UIViewController) {
        self.parentVC = parentVC
    }
    
    // MARK: - Splash Screen
    func createSplashScreen() {
        let module = AppModules.createSplashModule()
        module.modalPresentationStyle = .fullScreen
        self.parentVC?.present(module, animated: true, completion: nil)
    }
    
    // MARK: - Navigation View
    func createNavigationView() {
        let module = AppModules.createNavigationMenu()
        module.modalPresentationStyle = .fullScreen
        self.parentVC?.present(module, animated: true, completion: nil)
    }
    
    // MARK: - Detail Character View
    func createDetailCharacterView(with characterDetail: Character) {
        let module = AppModules.createDetailCharacterView(with: characterDetail)
        //module.modalPresentationStyle = .fullScreen
        self.parentVC?.present(module, animated: true, completion: nil)
    }

}
