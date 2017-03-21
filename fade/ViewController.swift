import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        view.layer.addSublayer(gradient)
    }
}

