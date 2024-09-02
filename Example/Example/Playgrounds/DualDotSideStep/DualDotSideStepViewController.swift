//
//  DualDotSideStepViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class DualDotSideStepViewController: CAViewController {
    
    let subview = DualDotSideStepView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
