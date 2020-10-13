
import UIKit

// MARK: - HeroTableViewCell
class HeroTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var heroName: UILabel!
    @IBOutlet var heroDescription: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var superContainerView: UIView!
    
    // MARK: - Properties
    
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        superContainerView.applyShadowNews()
        containerView.roundedView()
        heroImage.applyShadowAndCornerRadius()
    }
    
}
