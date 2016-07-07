//
//  ViewController.swift
//  BlurScroll
//
//  Created by miyamo on 2016/07/03.
//  Copyright © 2016年 Zombiyamo. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topsubLabel: UILabel!
    
    @IBOutlet weak var backgroundImageView: UIImageView?
    
    @IBOutlet weak var bearScrollView: UIScrollView?
    
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .Light))
    
    var scrollBeginPoint :CGPoint?
    var blurPara :CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let backgroundImageView = backgroundImageView else { return }
        guard let bearScrollView = bearScrollView else { return }
        
        self.bearScrollView?.delegate = self
        
        visualEffectView.frame = backgroundImageView.frame
        backgroundImageView.addSubview(visualEffectView)
        self.view.addSubview(backgroundImageView)
        backgroundImageView.alpha = 0.0
        self.view.bringSubviewToFront(bearScrollView)
        
        topLabel.adjustsFontSizeToFitWidth = true
        topsubLabel.adjustsFontSizeToFitWidth = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UIScrollViewDelegate {
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        scrollBeginPoint = scrollView.contentOffset
        print(scrollBeginPoint)
    }
    
    func setNavOpacity(opacity: CGFloat) {
        if let backgroundImageView = backgroundImageView {
            backgroundImageView.alpha = opacity
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
/*        let currentPoint = scrollView.contentOffset
        guard let scrollBeginPoint = scrollBeginPoint else { return }
        print(scrollView.frame.height)
        if scrollBeginPoint.y < currentPoint.y {
            print("下スクロール")
            if blurPara<1.0 && scrollBeginPoint.y > 0.0 && scrollBeginPoint.y < scrollView.frame.height{
                blurPara += 0.05
                guard let backgroundImageView = backgroundImageView else { return }
                backgroundImageView.alpha = blurPara
                print(blurPara)
            }
        }else{
            print("上スクロール")
            if blurPara>0.0 && scrollBeginPoint.y > 0.0 && scrollBeginPoint.y < scrollView.frame.height{
                blurPara -= 0.05
                guard let backgroundImageView = backgroundImageView else { return }
                backgroundImageView.alpha = blurPara
                print(blurPara)
            }
        }
*/
        let scrollValue = scrollView.contentOffset.y
        var opacity: CGFloat
        opacity = (scrollValue - 60)/200
        self.setNavOpacity(opacity)
    }
}