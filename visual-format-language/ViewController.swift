//
//  ViewController.swift
//  visual-format-language
//
//  Created by Diego  Collao on 24-06-16.
//  Copyright © 2016 Undisclosure. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let orangeView = UIView()
    let blueView = UIView()
    let purpleView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        orangeView.backgroundColor = UIColor.orange()
        blueView.backgroundColor = UIColor.blue()
        purpleView.backgroundColor = UIColor.purple()
        
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(orangeView)
        view.addSubview(blueView)
        view.addSubview(purpleView)
        
        let views: [String: AnyObject] = [
            "orangeView" : orangeView,
            "purpleView" : purpleView,
            "blueView" : blueView ,
            "topLayoutGuide" : self.topLayoutGuide
        ]
        
        let metrics: [String: AnyObject] = [
            "orangeViewWidth" : 200,
            "orangeViewHeight" : 57,
            "standardOffset" : 8,
            "bottomSpaceOffset" : 50
        ]
        
        //First H = HorizontalConstraint
        //      V = VerticalConstraint
        //So if "H:[viewName(value)] this will set values on Width
        //      "V:[viewName(value)] this will set values on Heigth
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[orangeView(orangeViewWidth)]", options: [], metrics: metrics, views: views))
        
        orangeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true 
                                                                            //Vertical topLayoutGuide - 10px between - purpleView 
                                                                            //Awesome.
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-standardOffset-[purpleView]-standardOffset-[orangeView(orangeViewHeight)]-bottomSpaceOffset-|", options: [], metrics: metrics, views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[topLayoutGuide]-standardOffset-[blueView]-standardOffset-[orangeView]", options: [], metrics: metrics, views: views))
    
        view.addConstraints((NSLayoutConstraint.constraints(withVisualFormat: "H:|-standardOffset-[purpleView(==blueView)]-standardOffset-[blueView]-standardOffset-|", options: [], metrics: metrics, views: views)))
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
}

