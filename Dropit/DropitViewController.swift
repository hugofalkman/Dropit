//
//  DropitViewController.swift
//  Dropit
//
//  Created by H Hugo Falkman on 2015-04-02.
//  Copyright (c) 2015 H Hugo Fakman. All rights reserved.
//

import UIKit

class DropitViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var gameView: UIView!
    
    // MARK: - Animation
    
    lazy var animator: UIDynamicAnimator = {
        let lazyDynaAnimator = UIDynamicAnimator(referenceView: self.gameView)
        return lazyDynaAnimator
    }()
    
    let dropitBehavior = DropitBehavior()
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animator.addBehavior(dropitBehavior)
    }

    // MARK: - UIDynamicAnimatorDelegate
    
    // MARK: - Gestures
    
    @IBAction func drop(sender: UITapGestureRecognizer) {
        drop()
    }
    
    // MARK: - Dropping
    
    var dropsPerRow = 10
    
    var dropSize: CGSize {
        let size = gameView.bounds.size.width / CGFloat(dropsPerRow)
        return CGSize(width: size, height: size)
    }
    
    func drop() {
        var frame = CGRect(origin: CGPointZero, size: dropSize)
        frame.origin.x = CGFloat.random(dropsPerRow) * dropSize.width
        
        let dropView = UIView(frame: frame)
        dropView.backgroundColor = UIColor.random
        
        dropitBehavior.addDrop(dropView)
    }
    
    // MARK: - Constants
    
}

// MARK: - Extensions

private extension CGFloat {
    static func random(max: Int) -> CGFloat {
        return CGFloat(arc4random() % UInt32(max))
    }
}

private extension UIColor {
    class var random: UIColor {
        switch arc4random()%5 {
        case 0: return UIColor.greenColor()
        case 1: return UIColor.blueColor()
        case 2: return UIColor.orangeColor()
        case 3: return UIColor.redColor()
        case 4: return UIColor.purpleColor()
        default: return UIColor.blackColor()
        }
    }
}