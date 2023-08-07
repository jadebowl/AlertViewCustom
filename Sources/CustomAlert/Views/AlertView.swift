import UIKit

public protocol AlertViewDelegate {
    func agreeAction()
    func cancelAction()
}

public class AlertView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var backgroundView: UIView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var agreeButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    public var delegate: AlertViewDelegate?
    var viewModel: AlertViewModel?
    
    func setupXib() {
        contentView = loadViewFromNib()
        addSubview(contentView)
        contentView.frame = bounds
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 16
    }
    
    public func setupContents(accentColor: UIColor, backgroundColor: UIColor, title: String, message: String, agreeTitle: String, cancelTitle: String) {
        let viewModel = AlertViewModel(accentColor: accentColor, backgroundColor: backgroundColor, title: title, message: message, agreeTitle: agreeTitle, cancelTitle: cancelTitle)
        backgroundView.backgroundColor = backgroundColor
        titleLabel.text = title
        messageLabel.text = message
        agreeButton.setTitle(agreeTitle, for: .normal)
        agreeButton.setTitleColor(accentColor.contrastColor(), for: .normal)
        agreeButton.backgroundColor = accentColor
        agreeButton.layer.cornerRadius = 16
        cancelButton.setTitle(cancelTitle, for: .normal)
        cancelButton.setTitleColor(accentColor, for: .normal)
        self.viewModel = viewModel
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
