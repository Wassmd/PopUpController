import UIKit

class BottomView: UIView {
    private lazy var stackView1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title3Label, title4Label])
        stackView.spacing = 10
        stackView.axis = .vertical

        return stackView
    }()

    private let title3Label: UILabel = {
        let label = UILabel()
        label.text = "I don't know man I don't know man I don't know man I don't know man I don't know man I don't know man I don't know man I don't know man I don't know man I don't know man"
        label.numberOfLines = 0

        return label
    }()

    private let title4Label: UILabel = {
        let label = UILabel()
        label.text = "You never be my home town girl."
        label.numberOfLines = 0

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(stackView1)
        stackView1.pinEdges(to: self)
    }

    func hide() {
        title3Label.isHidden = !title3Label.isHidden
        title4Label.isHidden = !title4Label.isHidden
    }
}
