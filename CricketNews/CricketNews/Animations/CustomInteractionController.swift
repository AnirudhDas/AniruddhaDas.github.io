//
//  CustomInteractionController.swift
//  CricketNews
//
//  Created by Anirudh Das on 7/5/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class CustomInteractionController: UIPercentDrivenInteractiveTransition {
    var navigationController: UINavigationController!
    var shouldCompleteTransition = false
    var transitionInProgress = false
    var completionSeed: CGFloat {
        return 1 - percentComplete
    }
    
    func attachToViewController(viewController: UIViewController) {
        navigationController = viewController.navigationController
        setupGestureRecognizer(view: viewController.view)
    }
    
    private func setupGestureRecognizer(view: UIView) {
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture)))
    }
    
    @objc func handlePanGesture(gestureRecognizer: UIPanGestureRecognizer) {
        let viewTranslation = gestureRecognizer.translation(in: gestureRecognizer.view!.superview!)
        switch gestureRecognizer.state {
        case .began:
            transitionInProgress = true
            navigationController.popViewController(animated: true)
        case .changed:
            let const = CGFloat(fminf(fmaxf(Float(viewTranslation.x / 200.0), 0.0), 1.0))
            shouldCompleteTransition = const > 0.5
            update(const)
        case .cancelled, .ended:
            transitionInProgress = false
            if !shouldCompleteTransition || gestureRecognizer.state == .cancelled {
                cancel()
            } else {
                finish()
            }
        default:
            print("Default")
        }
    }
}
