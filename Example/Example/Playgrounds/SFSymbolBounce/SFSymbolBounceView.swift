//
//  SFSymbolBounceView.swift
//  Example
//
//  Created by 김건우 on 8/14/24.
//

import UIKit

// MARK: - Views

class SFSymbolBounceView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        let width = self.frame.size.width
        let height = self.frame.size.height
        
        let image = UIImage(systemName: "sun.max")
        let config = UIImage.SymbolConfiguration(weight: .bold)
        
        let imageView = UIImageView(frame: self.bounds)
        imageView.image = image?.applyingSymbolConfiguration(config)
        imageView.tintColor = UIColor.systemOrange
        imageView.contentMode = .scaleAspectFit
        
        if #available(iOS 17.0, *) {
            imageView.addSymbolEffect(.bounce, options: .repeating)
        }
        
        self.addSubview(imageView)
        
    }
    
}


// MARK: - Preview

#Preview {
    SFSymbolBounceView()
}
