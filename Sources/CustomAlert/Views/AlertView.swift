import UIKit

public protocol AlertViewDelegate {
    func agreeAction()
    func cancelAction()
}

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
    
    public var delegate: AlertViewDelegate?
    
    func setupXib() {
        contentView = loadViewFromNib()
        addSubview(contentView)
        contentView.frame = bounds
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 16
    }
    
    public func setupContents(accentColor: UIColor, backgroundColor: UIColor, icon: UIImage? = nil, title: String? = nil, message: String? = nil, agreeTitle: String, agreeCornerRadius: CGFloat = 16, cancelTitle: String? = nil, position: AlertPosition? = .center, hostVC: UIViewController) {
        backgroundView.backgroundColor = backgroundColor
        iconImageView.image = icon
        iconImageView.tintColor = accentColor
        iconImageView.isHidden = iconImageView.image == nil
        titleLabel.text = title
        titleLabel.isHidden = titleLabel.text == nil
        messageLabel.text = message
        messageLabel.isHidden = messageLabel.text == nil
        agreeButton.setTitle(agreeTitle, for: .normal)
        agreeButton.setTitleColor(accentColor.contrastColor(), for: .normal)
        agreeButton.backgroundColor = accentColor
        agreeButton.layer.cornerRadius = agreeCornerRadius
        cancelButton.setTitle(cancelTitle, for: .normal)
        cancelButton.setTitleColor(accentColor, for: .normal)
        cancelButton.isHidden = cancelTitle == nil
        
        switch position {
        case .bottom:
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            alertCenterConstraint.isActive = false
            alertTopConstraint.isActive = false
            
            backgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -32).isActive = true
            
        default:
            backgroundView.translatesAutoresizingMaskIntoConstraints = false
            alertCenterConstraint.isActive = true
            alertTopConstraint.isActive = true
        }
        
        hostVC.view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: hostVC.view.topAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: hostVC.view.bottomAnchor, constant: 0).isActive = true
        self.leadingAnchor.constraint(equalTo: hostVC.view.leadingAnchor, constant: 0).isActive = true
        self.trailingAnchor.constraint(equalTo: hostVC.view.trailingAnchor, constant: 0).isActive = true
    }
    
    @IBAction func agreeAction(_ sender: UIButton) {
        delegate?.agreeAction()
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        delegate?.cancelAction()
    }
    
    func loadViewFromNib() -> UIView? {
        let nib = UINib(nibName: "AlertView", bundle: .module)
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
