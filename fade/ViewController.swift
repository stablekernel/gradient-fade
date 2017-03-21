import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    private var gradient: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient = CAGradientLayer()
        gradient.frame = label.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0, 0.1, 0.9, 1]
        label.layer.mask = gradient
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        gradient.frame = label.bounds
    }
}

