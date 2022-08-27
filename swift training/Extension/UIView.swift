//
//  UIView.swift
//  swift training
//
//  Created by Josicleison on 27/08/22.
//

import UIKit

extension UIView {
    
    func addSubViews(_ views: [UIView]) {
        
        for view in views {
            
            self.addSubview(view)
        }
    }
    
    func fillSuperview(_ margins: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        superview?.addConstraint(NSLayoutConstraint(item: self,
                                                    attribute: .top,
                                                    relatedBy: .equal,
                                                    toItem: superview,
                                                    attribute: .top,
                                                    multiplier: 1,
                                                    constant: margins))
        superview?.addConstraint(NSLayoutConstraint(item: self,
                                                    attribute: .leading,
                                                    relatedBy: .equal,
                                                    toItem: superview,
                                                    attribute: .leading,
                                                    multiplier: 1,
                                                    constant: margins))
        superview?.addConstraint(NSLayoutConstraint(item: self,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: superview,
                                                    attribute: .trailing,
                                                    multiplier: 1,
                                                    constant: -margins))
        superview?.addConstraint(NSLayoutConstraint(item: self,
                                                    attribute: .bottom,
                                                    relatedBy: .equal,
                                                    toItem: superview,
                                                    attribute: .bottom,
                                                    multiplier: 1,
                                                    constant: -margins))
    }
    
    func constraintTo(by: NSLayoutConstraint.Attribute,
                      relatedBy: NSLayoutConstraint.Relation = .equal,
                      toItem: Any?,
                      relation: Relation = .inside,
                      multiplier: CGFloat = 1,
                      _ constant: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        if relation == .outside {
            
            var itemBy: NSLayoutConstraint.Attribute
            
            switch by {
                
                case .top: itemBy = .bottom
                case .bottom: itemBy = .top
                case .width: itemBy = .height
                case .height: itemBy = .width
                
                default: itemBy = by
            }
            
            superview?.addConstraint(NSLayoutConstraint(item: self,
                                                        attribute: by,
                                                        relatedBy: relatedBy,
                                                        toItem: toItem,
                                                        attribute: itemBy,
                                                        multiplier: multiplier,
                                                        constant: constant))
        }
        else {
            
            superview?.addConstraint(NSLayoutConstraint(item: self,
                                                       attribute: by,
                                                       relatedBy: relatedBy,
                                                       toItem: toItem,
                                                       attribute: by,
                                                       multiplier: multiplier,
                                                       constant: constant))
        }
    }
}
