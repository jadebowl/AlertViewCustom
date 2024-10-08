import UIKit

class AlertViewCustom: UIView {
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
    
    lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.spacing = 24
        return stack
    }()
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var titlesStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 12
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = .preferredFont(forTextStyle: .headline)
        return title
    }()
    
    lazy var messageLabel: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.textAlignment = .center
        title.font = .preferredFont(forTextStyle: .subheadline)
        return title
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 4
        return stack
    }()
    
    lazy var agreeButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .semibold)
        return button
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .regular)
        return button
    }()
    
    weak var delegate: AlertViewDelegate?
    
    var alertCenterConstraint: NSLayoutConstraint?
    var alertTopConstraint: NSLayoutConstraint?
    var alertBottomConstraint: NSLayoutConstraint?
    var alertBottomAnimation = false
    
    func setupViews() {
        setupContentView()
        setupBlurredView()
        setupBackgroundView()
        setupMainStack()
        setupIcon()
        setupTitles()
        setupButtons()
        setupActions()
    }
    
    private func setupContentView() {
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupBlurredView() {
        contentView.addSubview(blurredView)
        blurredView.translatesAutoresizingMaskIntoConstraints = false
        blurredView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        blurredView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        blurredView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        blurredView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupBackgroundView() {
        contentView.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32).isActive = true
        backgroundView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
    }
    
    private func setupMainStack() {
        backgroundView.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 32).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -16).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 0).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: 0).isActive = true
    }
    
    private func setupIcon() {
        mainStackView.insertArrangedSubview(iconImageView, at: 0)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    private func setupTitles() {
        mainStackView.insertArrangedSubview(titlesStackView, at: 1)
        titlesStackView.translatesAutoresizingMaskIntoConstraints = false
        titlesStackView.insertArrangedSubview(titleLabel, at: 0)
        titlesStackView.insertArrangedSubview(messageLabel, at: 1)
        titlesStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 16).isActive = true
    }
    
    private func setupButtons() {
        mainStackView.insertArrangedSubview(buttonsStackView, at: 2)
        buttonsStackView.insertArrangedSubview(agreeButton, at: 0)
        buttonsStackView.insertArrangedSubview(cancelButton, at: 1)
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 16).isActive = true
        agreeButton.translatesAutoresizingMaskIntoConstraints = false
        agreeButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    private func setupActions() {
        agreeButton.addTarget(self, action: #selector(agreeAction), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
    }
    
    @objc private func agreeAction(_ sender: UIButton) {
        delegate?.agreeAction()
    }
    
    @objc private func cancelAction(_ sender: UIButton) {
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
