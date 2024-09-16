//
//  ActivityIndicatorView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

// MARK: - View

class ActivityIndicatorView: UIView {

    override func draw(_ rect: CGRect) {
        
        let spinner = UIActivityIndicatorView(style: .large)
        let scale = self.frame.size.width / spinner.frame.size.width
        spinner.transform = CGAffineTransform(scaleX: scale, y: scale)
        spinner.frame = self.bounds
        spinner.color = UIColor.systemOrange
        spinner.hidesWhenStopped = true
        spinner.startAnimating()
        self.addSubview(spinner)
        
    }
    
}


// MARK: - Preview

#Preview {
    ActivityIndicatorView()
}
