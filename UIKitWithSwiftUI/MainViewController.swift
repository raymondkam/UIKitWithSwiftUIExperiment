//
//  MainViewController.swift
//  UIKitWithSwiftUI
//
//  Created by cl-dev on 2020-11-23.
//

import UIKit
import SwiftUI
import Combine

class MainViewController: UITableViewController {

    var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func showLogin(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> UIViewController? {
        let loginVM = LoginViewModel()
        handle(loginViewModel: loginVM)
        return UIHostingController(coder: coder, rootView: LoginView(viewModel: loginVM))
    }

    private func handle(loginViewModel: LoginViewModel) {
        loginViewModel.loginSuccess
            .sink { [weak self] _ in
                self?.dismiss(animated: true, completion: nil)
            }
            .store(in: &cancellables)
    }
}

