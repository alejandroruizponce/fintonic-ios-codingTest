import UIKit

// MARK: - SplashScreenViewController
class SplashScreenViewController: UIViewController {

    // MARK: - IBOutlets

    
    // MARK: - Properties
	var presenter: SplashScreenPresenter?

    // MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.presenter?.goToHomeView()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

}


// MARK: - SplashScreenView Protocol
extension SplashScreenViewController: SplashScreenView {

}
