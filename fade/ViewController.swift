import UIKit

class ViewController: UIViewController {
    private var gradient: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.purple.cgColor, UIColor.purple.cgColor, UIColor.blue.cgColor]
        gradient.locations = [0, 0.1, 0.9, 1]
        view.layer.addSublayer(gradient)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradient.frame = view.bounds
    }
}

