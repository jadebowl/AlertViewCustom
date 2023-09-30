import UIKit

public class CustomAlertView: UIView {
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var blurredView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        return blurredEffectView
    }()
    
    lazy var backgroundView: UIView = {
        let view = UIView()
        return view
    }()
    
    var iconImageView = UIImageView()
    var titleLabel = UILabel()
    var messageLabel = UILabel()
    
    var agreeButton = UIButton()
    var cancelButton = UIButton()
    
    var alertCenterConstraint: NSLayoutConstraint?
    var alertTopConstraint: NSLayoutConstraint?
    
    var delegate: AlertViewDelegate?
    
    var alertBottomConstraint: NSLayoutConstraint?
    var alertBottomAnimation = false
        
    func setupViews() {
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        contentView.addSubview(blurredView)
        blurredView.translatesAutoresizingMaskIntoConstraints = false
        blurredView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        blurredView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        blurredView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        blurredView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        contentView.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.topAnchor.constraint(lessThanOrEqualTo: contentView.topAnchor, constant: 300).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    func setupActions() {
        
    }
    
    @objc func agreeAction(_ sender: UIButton) {
        delegate?.agreeAction()
    }
    
    @objc func cancelAction(_ sender: UIButton) {
        delegate?.cancelAction()
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupViews()
    }
}
