//
// Created by Mattia Righetti on 2019-08-15.
// Copyright (c) 2019 Mattia Righetti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var circleVC: CircularLoaderVC = {
        let viewController = CircularLoaderVC()
        viewController.view.translatesAutoresizingMaskIntoConstraints = false
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        add(circleVC)
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            circleVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            circleVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            circleVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            circleVC.view.topAnchor.constraint(equalTo: self.view.topAnchor)
        ])
    }

}
