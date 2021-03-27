//
//  MemberView.swift
//  DemoProject
//
//  Created by Wasim on 26.10.20.
//

import UIKit

final class MemberView: UIView {
    private let thumbnail: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "camera"))
        imageView.pinSize(to: CGSize(width: 44, height: 44))
        return imageView
    }()

    private let title3Label: UILabel = {
        let label = UILabel()
        label.text = "Label in stackView"
        return label
    }()

    private let title4Label: UILabel = {
        let label = UILabel()
        label.text = "!Hola !Hola !Hola !Hola !Hola !Hola !Hola !Hola !Hola !Hola"
        label.numberOfLines = 0

        return label
    }()

    private lazy var stackView1: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title3Label, title4Label])
        stackView.spacing = 10
        stackView.axis = .vertical

        return stackView
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [thumbnail, stackView1])
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(mainStackView)
        mainStackView.pinEdges(to: self)
    }
}
