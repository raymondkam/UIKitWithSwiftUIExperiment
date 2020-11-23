//
//  MainViewController.swift
//  UIKitWithSwiftUI
//
//  Created by cl-dev on 2020-11-23.
//

import UIKit
import SwiftUI

class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func showLogin(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: LoginView(loginAction: { loginInfo in
            // Do login.. hm..
            print("username: \(loginInfo.username), password: \(loginInfo.password)")
        }))
    }

}

