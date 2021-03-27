//
//  ViewController.swift
//  DemoProject
//
//  Created by Wasim on 22.10.20.
//

import UIKit

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.gray.cgColor

        return view
    }()

    private let title1Label: UILabel = {
        let label = UILabel()
        label.text = "Wasim"
        return label
    }()

    private let title2Label: UILabel = {
        let label = UILabel()
        label.text = "Wasimuddin"
        return label
    }()

    private let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Show Details", for: .normal)
        button.addTarget(self, action: #selector(showDetails), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [title1Label, title2Label, actionButton])
        stackView.spacing = 10
        stackView.axis = .vertical

        return stackView
    }()

    private let bottomView = BottomView(frame: .zero)

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupConstraints()
    }

    private func setupView() {
        view.addSubview(containerView)
        containerView.addSubview(stackView)
        containerView.addSubview(bottomView)
        containerView.addSubview(dummyView)
    }

    private var bottomConstraint: NSLayoutConstraint?
    private let dummyView = UIView()

    private func setupConstraints() {
        containerView.centerVertically(to: view)
        containerView.centerHorizontally(to: view)
        containerView.pinLeadingAndTrailingEdges(to: view, withOffset: 20)

        stackView.pinTopEdge(to: containerView, withOffset: 20)
        stackView.pinLeadingEdge(to: containerView, withOffset: 20)
        stackView.pinTrailingEdge(to: containerView, withOffset: -20)

        bottomView.pinTopEdgeToBottom(of: stackView, withOffset: 10)
        bottomView.pinLeadingAndTrailingEdges(to: containerView, withOffset: 20)

        dummyView.pinTopEdgeToBottom(of: bottomView)
        dummyView.pinLeadingAndTrailingEdges(to: containerView, withOffset: 20)
        dummyView.pinBottomEdge(to: containerView, withOffset: -8)
    }

    @objc
    private func showDetails() {
        let controller = ChoiceTableTableViewController()
        controller.preferredContentSize = CGSize(width: 300, height: 200)
        controller.modalPresentationStyle = .popover

        showPopOver(controller, sourceView: actionButton)
        present(DemoViewController(), animated: true)
        
        UIView.animate(withDuration: 0.2,
                       delay: 0,
                       options: [.curveEaseOut, .beginFromCurrentState],
                       animations: {
                        self.bottomView.hide()
        })
    }

    private func showPopOver(_ controller: UIViewController, sourceView: UIView) {
        let presentationController = controller.presentationController as! UIPopoverPresentationController
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceView.bounds
        presentationController.permittedArrowDirections = [.down, .up]
        presentationController.delegate = self

        present(controller, animated: true)
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none
        }
}

