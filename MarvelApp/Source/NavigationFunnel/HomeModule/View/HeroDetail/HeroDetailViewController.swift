
import UIKit
import Nuke

// MARK: - HeroDetailViewController
class HeroDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var heroName: UILabel!
    @IBOutlet var heroDescription: UITextView!
    
    
    // MARK: - Properties
    var character: Character?
    let options = ImageLoadingOptions(
        placeholder: UIImage(named: "placeholder"),
        transition: .fadeIn(duration: 0.33)
    )

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
    }
    
    func setupData() {
        heroName.text = character?.name
        heroDescription.text = character?.description
        if let imageUrl = URL(string: character?.image ?? "") {
            Nuke.loadImage(with: imageUrl, options: options, into: heroImage)
        }
    }
}
