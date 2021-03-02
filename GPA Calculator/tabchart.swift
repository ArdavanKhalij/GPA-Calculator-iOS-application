//
//  tabchart.swift
//  GPA Calculator
//
//  Created by ardavan on 2/19/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//

import UIKit
class tabchart: UIViewController {
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet private var chartView: MacawChartView!
    override func viewDidLoad() {
        super.viewDidLoad()
        chartView.contentMode = .scaleAspectFit
    }
    @IBAction func showChartButtonTapped(_ sender: Any) {
        MacawChartView.playAnimations()
    }
}
