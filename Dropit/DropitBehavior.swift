//
//  DropitBehavior.swift
//  Dropit
//
//  Created by H Hugo Falkman on 2015-04-07.
//  Copyright (c) 2015 H Hugo Fakman. All rights reserved.
//

import UIKit

class DropitBehavior: UIDynamicBehavior {
    
    let gravity = UIGravityBehavior()
    
    lazy var collider: UICollisionBehavior = {
        let lazyCollider = UICollisionBehavior()
        lazyCollider.translatesReferenceBoundsIntoBoundary = true
        return lazyCollider
        }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
    }
    
    func addDrop(drop: UIView) {
        dynamicAnimator?.referenceView?.addSubview(drop)
        gravity.addItem(drop)
        collider.addItem(drop)
    }
    
    func removeDrop(drop: UIView) {
        gravity.removeItem(drop)
        collider.removeItem(drop)
        drop.removeFromSuperview()
    }
}
