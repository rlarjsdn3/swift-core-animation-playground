//
//  PacmanProgressViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class PacmanProgressViewController: CAViewController {
    
    let subview = PacmanProgressView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
