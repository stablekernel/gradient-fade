import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.purple.cgColor, UIColor.purple.cgColor, UIColor.blue.cgColor]
        gradient.locations = [0, 0.1, 0.9, 1]
        view.layer.addSublayer(gradient)
    }
}

