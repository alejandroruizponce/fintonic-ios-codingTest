import UIKit

extension UIImageView {
    func roundedImage() {
        layer.cornerRadius = 8.0
        clipsToBounds = true
    }
    
    func roundedNewsImage() {
        layer.cornerRadius = 8.0
        clipsToBounds = true
    }
    
    func circledImage() {
        layer.masksToBounds = false
        layer.cornerRadius = frame.size.width / 2
        clipsToBounds = true
    }
    
    func setImageColor(color: UIColor) {
        let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
        self.image = templateImage
        self.tintColor = color
    }
    
    func applyShadowAndCornerRadius() {
        layer.cornerRadius = 5.0
        layer.shadowOpacity = 0.3
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowColor = UIColor.gray.cgColor
    }
    
}
