//
//  WLMoveImageTransition.swift
//  FruitApp
//
//  Created by Wei Lu on 23/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import Foundation
import UIKit

struct AnimationHelper {
    static func yRotation(angle: Double) -> CATransform3D {
        return CATransform3DMakeRotation(CGFloat(angle), 0.0, 1.0, 0.0)
    }

    static func perspectiveTransformForContainerView(containerView: UIView) {
        var transform = CATransform3DIdentity
        transform.m34 = -0.002
        containerView.layer.sublayerTransform = transform
    }
}

protocol WLMoveImageTransitionProtocol {
    func sourceImageView() -> UIImageView?

    func didTransitionBegin()
    func didTransitionEnd()
}

extension WLMoveImageTransitionProtocol {
    func didTransitionBegin() {}
    func didTransitionEnd() {}

    func sourceImageView() -> UIImageView? {
        return nil
    }
}

class WLMoveImageTransition: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromVC         = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let toVC           = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to),
            let fromVCProtocol = fromVC as? WLMoveImageTransitionProtocol,
            let toVCProtocol   = toVC as? WLMoveImageTransitionProtocol
        else {
                return
        }

        guard
            let originalImgView    = fromVCProtocol.sourceImageView(),
            let destinationImgView = toVCProtocol.sourceImageView()
            else {
                return
        }

        let containerView = transitionContext.containerView
        let duration      = transitionDuration(using: transitionContext)
        containerView.addSubview(toVC.view)
        containerView.addSubview(originalImgView)
        fromVCProtocol.didTransitionBegin()
        toVCProtocol.didTransitionBegin()

        UIView.animate(withDuration: duration, animations: {
            originalImgView.center    = destinationImgView.center
            let scaleRatio            = destinationImgView.frame.size.width / originalImgView.frame.width
            originalImgView.transform = CGAffineTransform(scaleX: scaleRatio, y: scaleRatio)
        }) { (finshed) in
            originalImgView.isHidden = true
            originalImgView.removeFromSuperview()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)

            fromVCProtocol.didTransitionEnd()
            toVCProtocol.didTransitionEnd()
        }
    }
}
