import UIKit

extension UIView {
    
    func applyShadow() {
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: -8.0)
        self.layer.shadowColor = UIColor.gray.cgColor
    }
    
    func applyShadowStories() {
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 4.0
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowColor = UIColor.gray.cgColor
    }
    
    func applyShadowNews() {
        layer.cornerRadius = 8.0
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 8.0

    }
    
    func roundedView() {
        layer.cornerRadius = 8.0
        layer.masksToBounds = true
    }
    
    func roundedScrollViewNew() {
        layer.cornerRadius = 32.0
        layer.masksToBounds = true
    }

}


