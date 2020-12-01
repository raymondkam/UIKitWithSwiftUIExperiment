//
//  SwiftUIContainerViewController.swift
//  UIKitWithSwiftUI
//
//  Created by cl-dev on 2020-11-23.
//

import UIKit
import SwiftUI
import Combine

class SwiftUIContainerViewController: UIViewController {

    @IBOutlet weak var containerViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var containerView: UIView!

    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginVM = LoginViewModel()
        handle(loginViewModel: loginVM)

        let loginVC = UIHostingController(rootView: LoginView(viewModel: loginVM, onSizeChanged: { [weak self] newSize in
            self?.containerViewWidthConstraint.constant = newSize.width
            self?.containerViewWidthConstraint.isActive = true
            self?.containerViewHeightConstraint.constant = newSize.height
            self?.containerViewHeightConstraint.isActive = true
        }))
        addChild(loginVC)
        containerView.addSubview(loginVC.view)

        loginVC.view.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            loginVC.view.topAnchor.constraint(equalTo: containerView.topAnchor),
            loginVC.view.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            loginVC.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            loginVC.view.rightAnchor.constraint(equalTo: containerView.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)

        loginVC.didMove(toParent: self)
    }

    private func handle(loginViewModel: LoginViewModel) {
        loginViewModel.loginSuccess
            .sink { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }
            .store(in: &cancellables)
    }
}
