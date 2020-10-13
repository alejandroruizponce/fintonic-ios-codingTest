
import UIKit
import SwiftPopup

class ConnectionAlertViewController: SwiftPopup {
    
    @IBOutlet var logoOffline: UIImageView!
    @IBOutlet var messageOffline: UILabel!
    @IBOutlet var continueButton: UIButton!
    @IBOutlet var containerView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }
    
    func setupData() {
        messageOffline.text = NSLocalizedString("messageOffline", comment: "")
        continueButton.setTitle(NSLocalizedString("messageOffline", comment: ""), for: .normal)
    }


    func setupUI() {
        continueButton.applyShadowAndCornerRadius()
        containerView.roundedView()
    }
    
    @IBAction func tapContinue(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
