//
//  SwiftUIContainerViewController.swift
//  UIKitWithSwiftUI
//
//  Created by cl-dev on 2020-11-23.
//

import UIKit
import SwiftUI

class SwiftUIContainerViewController: UIViewController {

    @IBOutlet weak var containerViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var containerViewHeightConstraint: NSLayoutConstraint!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginVC = UIHostingController(rootView: LoginView(viewModel: LoginViewModel(), onSizeChanged: { [weak self] newSize in
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
            containerView.bottomAnchor.constraint(equalTo: loginVC.view.bottomAnchor),
            containerView.rightAnchor.constraint(equalTo: loginVC.view.rightAnchor)
        ]
        NSLayoutConstraint.activate(constraints)

        loginVC.didMove(toParent: self)
    }

}
