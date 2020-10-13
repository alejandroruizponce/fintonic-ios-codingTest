import UIKit

// MARK: - NavViewController
class NavViewController: UITabBarController, UITabBarControllerDelegate  {
    
    // MARK: - Init and Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        let item1 = AppModules.createHomeModule()
        let item2 = AppModules.createArenaModule(with: self)
        let item3 = AppModules.createRankingModule()
        
        let icon1 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "feedIcon"), selectedImage: #imageLiteral(resourceName: "feedIcon"))
        item1.tabBarItem = icon1
        let icon2 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "battleIcon"), selectedImage: #imageLiteral(resourceName: "battleIcon"))
        item2.tabBarItem = icon2
        let icon3 = UITabBarItem(title: "", image: #imageLiteral(resourceName: "rankingIcon"), selectedImage: #imageLiteral(resourceName: "rankingIcon"))
        item3.tabBarItem = icon3

        
        let controllers = [item1, item2, item3]
        tabBar.barTintColor = UIColor.white
        tabBar.tintColor = UIColor.black


        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOffset = CGSize(width: 0.0, height: 8.0)
        tabBar.layer.shadowRadius = 15
        tabBar.layer.shadowOpacity = 0.4
        tabBar.layer.masksToBounds = false
        tabBar.layer.borderWidth = 0.0
        
        viewControllers = controllers

    }
    
    
    // MARK: - Delegate Methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)


    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)


    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

  
}
