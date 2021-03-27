import UIKit

final class DemoViewController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.gray.cgColor

        return view
    }()

    private let title1Label: UILabel = {
        let label = UILabel()
        label.text = "Lable-1"
        return label
    }()

    private let title2Label: UILabel = {
        let label = UILabel()
        label.text = "Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there! Hi You there!"
        label.numberOfLines = 0

        return label
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [MemberView(), MemberView()])
        stackView.spacing = 10
        stackView.axis = .vertical

        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraints()
    }

    private func setupView() {
        view.addSubview(containerView)
        containerView.addSubview(title1Label)
        containerView.addSubview(title2Label)
        containerView.addSubview(mainStackView)
    }

    private func setupConstraints() {
        containerView.centerVertically(to: view)
        containerView.centerHorizontally(to: view)
        containerView.pinLeadingAndTrailingEdges(to: view, withOffset: 20)

        title1Label.pinTopEdge(to: containerView)
        title1Label.pinLeadingAndTrailingEdges(to: containerView)

        title2Label.pinTopEdgeToBottom(of: title1Label)
        title2Label.pinLeadingAndTrailingEdges(to: containerView)

        mainStackView.pinTopEdgeToBottom(of: title2Label, withOffset: 20)
        mainStackView.pinLeadingAndTrailingEdges(to: containerView, withOffset: 8)
        mainStackView.pinBottomEdge(to: containerView, withOffset: -10)
    }
}
