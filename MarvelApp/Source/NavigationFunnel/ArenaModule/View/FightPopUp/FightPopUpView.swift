
import UIKit
import Nuke
import SwiftPopup

// MARK: - FightPopUpView
class FightPopUpView: SwiftPopup {
    
    // MARK: - IBOutlets
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var winnerText: UILabel!
    @IBOutlet var backButton: UIButton! {
        didSet {
            backButton.setTitle(NSLocalizedString("backButton", comment: ""), for: .normal)
        }
    }
    @IBOutlet var rankingButton: UIButton!
    @IBOutlet var containerView: UIView!
    
    // MARK: - Properties
    var characterWinner: Character?
    let options = ImageLoadingOptions(
        placeholder: UIImage(named: "placeholder"),
        transition: .fadeIn(duration: 0.33)
    )
    var delegateView: ArenaView?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        setupData()
    }
    
    func setupData() {
        if let name = characterWinner?.name {
            winnerText.text = "¡" + name + NSLocalizedString("winnerText", comment: "")
        }
        if let imageUrl = URL(string: characterWinner?.image ?? "") {
            Nuke.loadImage(with: imageUrl, options: options, into: heroImage)
        }
    }

    func setupUI() {
        heroImage.applyShadowAndCornerRadius()
        backButton.applyShadowAndCornerRadius()
        rankingButton.applyShadowAndCornerRadius()
        containerView.roundedView()
    }
    
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapRankingButton(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            self.delegateView?.goToRakingTab()
        })

    }
    
}
