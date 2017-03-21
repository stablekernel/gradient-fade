import UIKit

class ViewController: UIViewController, UIScrollViewDelegate, CALayerDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var label: UILabel!
    
    private var gradient: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor, UIColor.clear.cgColor]
        gradient.locations = [0, 0.1, 0.9, 1]
        gradient.delegate = self
        scrollView.layer.mask = gradient
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        updateGradientFrame()
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateGradientFrame()
    }
    
    // MARK: - CALayerDelegate
    func action(for layer: CALayer, forKey event: String) -> CAAction? {
        return NSNull()
    }
    
    // MARK: - Convenience
    private func updateGradientFrame() {
        gradient.frame = CGRect(
            x: 0,
            y: scrollView.contentOffset.y,
            width: scrollView.bounds.width,
            height: scrollView.bounds.height
        )
    }
}

