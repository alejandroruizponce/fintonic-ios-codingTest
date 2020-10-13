import UIKit

// MARK: - FighterCollectionViewCell
class FighterCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    @IBOutlet var fighterImage: UIImageView!
    @IBOutlet var fighterPower: UILabel!
    @IBOutlet var fighterName: UILabel!
    
    
    // MARK: - Properties
    var isFighterSelected: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI() {
        fighterImage.applyShadowAndCornerRadius()
        fighterPower.applyCornerRadius()
    }

}
