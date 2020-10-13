import UIKit

extension UILabel {
    func applyCornerRadius() {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = frame.size.height/2.0
    }
}
    
