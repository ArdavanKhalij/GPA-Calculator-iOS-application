//
//  result.swift
//  GPA Calculator
//
//  Created by ardavan on 2/17/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//

import UIKit

class result: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    @IBOutlet var gg: UILabel!
    @IBOutlet var ug: UILabel!
    @IBOutlet var tabbar: UIButton!
    
    @IBAction func back(_ sender: Any) {
        i=0
        lastTenShows.removeAll()
        data100ForCalculate.removeAll()
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet var grade: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ug.text = String(resultNumberGerman!)
        gg.text = String(resultNumberUSA!)
        tabbar.layer.cornerRadius = 10
        tabbar.layer.masksToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
