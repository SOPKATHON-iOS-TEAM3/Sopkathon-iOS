//
//  UIView+.swift
//  Sopkathon-iOS
//
//  Created by 이명진 on 5/16/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
