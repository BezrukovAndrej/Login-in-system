//
//  UIView + Extensions .swift
//  Login in system
//
//  Created by Andrey Bezrukov on 22.08.2023.
//

import UIKit

extension UIView {
    
    func addViewsTAMIC(_ views: UIView) {
        self.addSubview(views)
        views.translatesAutoresizingMaskIntoConstraints = false
    }
}
