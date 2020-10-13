
import UIKit

// MARK: - RankTableViewCell
class RankTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var rankPosition: UILabel!
    @IBOutlet var heroImage: UIImageView!
    @IBOutlet var heroName: UILabel!
    @IBOutlet var heroPower: UILabel!
    @IBOutlet var containerView: UIView!
    @IBOutlet var superContainerView: UIView!
    
    
    // MARK: - Properties

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI() {
        heroImage.applyShadowAndCornerRadius()
        superContainerView.applyShadowNews()
        containerView.roundedView()
    }
    
}
