import UIKit

public class CustomAlertView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var alertCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var alertTopConstraint: NSLayoutConstraint!
    
    var delegate: AlertViewDelegate?
    
    var alertBottomConstraint: NSLayoutConstraint?
    var alertBottomAnimation = false
        
    func setupXib() {
        contentView = loadViewFromNib()
        addSubview(contentView)
        contentView.frame = bounds
        contentView.backgroundColor = .clear
    }
    
    @IBAction func agreeAction(_ sender: UIButton) {
        delegate?.agreeAction()
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        delegate?.cancelAction()
    }
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(identifier: "com.jadegoescoding.CustomAlert")
        let nib = UINib(nibName: "CustomAlertView", bundle: bundle)
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
