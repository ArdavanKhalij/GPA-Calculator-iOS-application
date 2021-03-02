//
//  ViewController.swift
//  GPA Calculator
//
//  Created by ardavan on 2/13/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//

import UIKit
class mainPage: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
//////////*outlet*//////////
    @IBOutlet var f100: UIButton!
    @IBOutlet var f20: UIButton!
    @IBOutlet var f10: UIButton!
    @IBOutlet var f6: UIButton!
//////////*outlet*//////////
    override func viewDidLoad() {
        super.viewDidLoad()
        //////////*Radius*//////////
        f100.layer.cornerRadius = 5
        f100.layer.masksToBounds = true
        f20.layer.cornerRadius = 5
        f20.layer.masksToBounds = true
        f10.layer.cornerRadius = 5
        f10.layer.masksToBounds = true
        f6.layer.cornerRadius = 5
        f6.layer.masksToBounds = true
        //////////*Radius*//////////
        //////////*Fade in Fade out animation*//////////
        configureAssets()
        //////////*Fade in Fade out animation*//////////
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        introAnimation()
    }
    func configureAssets() {
        self.f100.alpha = 0.0
        self.f20.alpha = 0.0
        self.f10.alpha = 0.0
        self.f6.alpha = 0.0
    }
    func fadeInAsset1() {
        self.f100.alpha = 1.0
    }
    func fadeInAsset2(){
        self.f20.alpha = 1.0
    }
    func fadeInAsset3(){
        self.f10.alpha = 1.0
    }
    func fadeInAsset4(){
        self.f6.alpha = 1.0
    }
    func introAnimation(){
        UIView.animate(withDuration: 0.3, delay: 0.3, options: .curveEaseOut, animations: {
            self.fadeInAsset1()
        }, completion: nil)
        UIView.animate(withDuration: 0.3, delay: 0.4, options: .curveEaseOut, animations: {
            self.fadeInAsset2()
        }, completion: nil)
        UIView.animate(withDuration: 0.3, delay: 0.5, options: .curveEaseOut, animations: {
            self.fadeInAsset3()
        }, completion: nil)
        UIView.animate(withDuration: 0.3, delay: 0.6, options: .curveEaseOut, animations: {
            self.fadeInAsset4()
        }, completion: nil)
    }
    
    @IBAction func goTo6(_ sender: Any) {
        I = 6
    }
    @IBAction func goTo10(_ sender: Any) {
        I = 10
    }
    @IBAction func goTo20(_ sender: Any) {
        I = 20
    }
    @IBAction func goTo100(_ sender: Any) {
        I = 100
    }
    
}

