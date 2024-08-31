//
//  TriangleDotShiftViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class TriangleDotShiftViewController: CAViewController {
    
    let subview = TriangleDotShiftView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
