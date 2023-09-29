import UIKit

public class AlertView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var alertCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertTopConstraint: NSLayoutConstraint!
    
    var alertBottomConstraint: NSLayoutConstraint?
    var alertBottomAnimation = false
        
    func setupXib() {
        contentView = loadViewFromNib()
        addSubview(contentView)
        contentView.frame = bounds
        contentView.backgroundColor = .clear
    }
    
    @IBAction func agreeAction(_ sender: UIButton) {
        AlertWindow.shared.delegate?.agreeAction()
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        AlertWindow.shared.delegate?.cancelAction()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "AlertView", bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupXib()
    }
}
