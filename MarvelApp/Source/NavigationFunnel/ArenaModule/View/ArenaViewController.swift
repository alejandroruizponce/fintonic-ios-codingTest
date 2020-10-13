import UIKit
import Nuke
import Lottie

class ArenaViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var firstFightersView: FightersView! {
        didSet {
            firstFightersView.delegateView = self
        }
    }
    @IBOutlet var secondFightersView: FightersView! {
        didSet {
            secondFightersView.delegateView = self
        }
    }
    @IBOutlet var fightButton: UIButton! {
        didSet {
            fightButton.disableButton()
            fightButton.setTitle(NSLocalizedString("buttonFight", comment: ""), for: .normal)
        }
    }
    
    
    // MARK: - Properties
	var presenter: ArenaPresenter?
    var firstFighter: Character?
    var secondFighter: Character?
    var tabBar: UITabBarController?
    

    // MARK: - Life Cycle
	override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if !Reachability.isConnectedToNetwork() {
            let connectionPopUp = ConnectionAlertViewController()
            connectionPopUp.show(above: self)
        }
    }
    
    func setupUI() {
        firstFightersView.applyShadowNews()
        secondFightersView.applyShadowNews()
        fightButton.applyShadowAndCornerRadius()
    }
    
    @IBAction func tapFightButton(_ sender: Any) {
        presenter?.startFight(with: firstFighter!, versus: secondFighter!)
    }
}


// MARK: - ArenaView Protocol
extension ArenaViewController: ArenaView {
    
    func showPopUpResult(with winner: Character) {
        let popUp = FightPopUpView()
        popUp.characterWinner = winner
        popUp.delegateView = self
        popUp.show(above: self)
    }
    
    func goToRakingTab() {
        tabBar?.selectedIndex = 2
    }
    
    func callPresenterMakeInitialRequest(for viewFighter: FightersView) {
        presenter?.makeRequestInitialCharacters(for: viewFighter)
    }
    
    func callPresenterMakeRequestByName(with name: String, for viewFighter: FightersView) {
        fightButton.disableButton()
        presenter?.makeRequestsCharactersByName(with: name, for: viewFighter)
    }
    
    func reloadWithCharactersResult(with characters: [Character], for view: FightersView) {
        if view == firstFightersView {
            firstFightersView.listCharacters = characters
            firstFightersView.stopLoadingAnimation()
            firstFightersView.fightersCollection.reloadData()
        } else {
            secondFightersView.listCharacters = characters
            secondFightersView.stopLoadingAnimation()
            secondFightersView.fightersCollection.reloadData()
        }
    }
    func setCharacterSelected(from view: FightersView, with character: Character) {
        if view == firstFightersView {
            firstFighter = character
        } else {
            secondFighter = character
        }
        
        if firstFighter != nil && secondFighter != nil {
            fightButton.enableButton()
        }
    }
}
