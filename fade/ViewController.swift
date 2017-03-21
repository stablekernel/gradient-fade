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
        label.layer.mask = gradient
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.contentInset = UIEdgeInsets(top: scrollView.frame.height - 40, left: 0, bottom: 0, right: 0)
        updateGradient()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateGradient()
    }
    
    // MARK: - CALayerDelegate
    func action(for layer: CALayer, forKey event: String) -> CAAction? {
        return NSNull()
    }
    
    // MARK: - Convenience
    private func updateGradient() {
        gradient.frame = CGRect(
            x: 0,
            y: scrollView.contentOffset.y,
            width: scrollView.bounds.width,
            height: scrollView.bounds.height
        )
        
        let visibleMaxY = scrollView.contentOffset.y + scrollView.bounds.height
        let fadeCutoff = CGFloat(100)
        
        // Content isn't scrolled up very high, ease into the fade
        if visibleMaxY < fadeCutoff {
            let noFadeHeight = CGFloat(40)
            // 0 for no fade, 1 for full fade
            let fadeAdjustment = max(0, visibleMaxY - noFadeHeight) / (fadeCutoff - noFadeHeight)
            let bottomFadeLocation = 1 - (0.1 * fadeAdjustment)
            gradient.locations = [0, 0.1, NSNumber(value: Double(bottomFadeLocation)), 1]
        }
        // Reached the bottom of the scrollView content
        else if scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.bounds.height) {
            gradient.locations = [0, 0.1, 1, 1]
        }
        // Normal fade
        else {
            gradient.locations = [0, 0.1, 0.9, 1]
        }
    }
}

