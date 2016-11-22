//
//  ViewController.swift
//  Sensors
//
//  Created by Jak Tiano on 9/27/16.
//  Copyright © 2016 PacktPub. All rights reserved.
//

import UIKit
import CoreMotion
import Charts

class ViewController: UIViewController {
    
    @IBOutlet weak var lineChartView: LineChartView!
    var dataSet = LineChartDataSet(values: [], label: "Values")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func addChartPoint(data: Double) {

        let newDataPoint = ChartDataEntry(x: Double(dataSet.entryCount), y: data)
        dataSet.addEntry(newDataPoint)
        
        let chartData = LineChartData()
        chartData.addDataSet(dataSet)
        lineChartView.data = chartData
        
        DispatchQueue.main.async(execute: {
            self.lineChartView.notifyDataSetChanged()
            self.lineChartView.setNeedsDisplay()
        })
    }
}
