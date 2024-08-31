//
//  QuintupleDotDanceViewController.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

class QuintupleDotDanceViewController: CAViewController {
    
    let subview = QuintupleDotDanceView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(for: subview)
    }
    
}
