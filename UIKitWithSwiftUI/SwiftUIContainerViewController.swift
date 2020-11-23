//
//  SwiftUIContainerViewController.swift
//  UIKitWithSwiftUI
//
//  Created by cl-dev on 2020-11-23.
//

import UIKit
import SwiftUI

class SwiftUIContainerViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let loginVC = UIHostingController(rootView: LoginView(loginAction: { loginInfo in
            // Handle login
            print("username: \(loginInfo.username), password: \(loginInfo.password)")
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
