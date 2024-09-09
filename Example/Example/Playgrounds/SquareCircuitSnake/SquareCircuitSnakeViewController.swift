//
//  SquareCircuitSnakeViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class SquareCircuitSnakeViewController: CAViewController {
    
    let subview = SquareCircuitSnakeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
