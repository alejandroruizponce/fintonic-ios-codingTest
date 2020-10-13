import UIKit

extension UIButton {
    func applyShadowAndCornerRadius() {
        self.layer.cornerRadius = 5.0
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowColor = UIColor.gray.cgColor
    }

    func disableButton(){
        self.alpha = 0.5
        self.isEnabled = false
    }
    
    func enableButton(){
        self.alpha = 1.0
        self.isEnabled = true
    }
    
}
