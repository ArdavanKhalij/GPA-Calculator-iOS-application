 //
//  MacawChartView.swift
//  GPA Calculator
//
//  Created by ardavan on 2/19/1398 AP.
//  Copyright © 1398 Ardavan. All rights reserved.
//

import Foundation
import Macaw
 var lastTenShows = [SwiftNewsVideo]()
 class MacawChartView: MacawView{
    //var lastTenShows = [SwiftNewsVideo]()//createDummyData()
    static let maxValue = 6000
    static let maxValueLineHeight = 180
    static let lineWidth:Double = 54.5 * Double(i)
    //func lastTenShowsremover(){
    //    MacawChartView.lastTenShows.removeAll()
    //}
    static let dataDivisor = Double(maxValue/maxValueLineHeight)
    static var adjustedData: [Double] = lastTenShows.map({ $0.viewCount! / dataDivisor })
    static var animations: [Animation] = []
    
    required init?(coder aDecoder: NSCoder){
        super.init(node: MacawChartView.createChart(), coder: aDecoder)
        backgroundColor = .clear
    }
    private static func createChart()-> Group{
        var items: [Node] = addYAxisItems() + addXAxisItems()
        items.append(createBars())
        return Group(contents: items, place: .identity)
    }
    private static func addYAxisItems() -> [Node] {
        var maxLines = 5
        var lineSpacing: Double = 30*6/5
        //let maxLines = 5
        let lineInterval = Int(maxValue/maxLines)
        var yAxisHeight: Double = 200
       // let lineSpacing: Double = 30*6/5
        
        var newNodes: [Node] = []
        
        for i in 1...maxLines{
            let y = yAxisHeight - (Double(i) * lineSpacing)
            let  valueLine = Line(x1: -5, y1: y, x2: lineWidth, y2: y).stroke(fill: Color.white.with(a: 0.10))
            var valueText = Text(text: "\(i * lineInterval)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
            if(I == 100){
                valueText = Text(text: "\(i * lineInterval / 60)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
            }
            //////////////////////
            if(I == 20){
                valueText = Text(text: "\(i * lineInterval / 300)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
            }
            if(I == 10){
                valueText = Text(text: "\(i * lineInterval / 600)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
            }
            if(I == 6){
                valueText = Text(text: "\(i * lineInterval / 1000)", align: .max, baseline: .mid, place: .move(dx: -10, dy: y))
            }
            //////////////////////
            valueText.fill = Color.white
            
            newNodes.append(valueLine)
            newNodes.append(valueText)
        }
        let yAxis = Line(x1: 0, y1: 0, x2: 0, y2: yAxisHeight).stroke(fill: Color.white.with(a: 0.15))
        newNodes.append(yAxis)
        return newNodes
    }
    private static func addXAxisItems() -> [Node] {
        let chartBaseY: Double = 200
        var newNodes: [Node] = []
        
        for i in 1...adjustedData.count {
            let x = (Double(i)*50)
            var valueText = Text(text: lastTenShows[i-1].showNumber! , align: .max, baseline: .mid, place: .move(dx: x, dy: chartBaseY+15))
            valueText.fill = Color.white
            valueText.font = Font.init(name: "Avenir next", size: 6, weight: "regular")
            newNodes.append(valueText)
        }
        let xAxis = Line(x1: 0, y1: chartBaseY, x2: lineWidth, y2: chartBaseY).stroke(fill: Color.white.with(a: 0.15))
        newNodes.append(xAxis)
        return newNodes
    }
    private static func createBars() -> Group {
        let fill = LinearGradient(degree: 90, from: Color(val: 0xff4704), to: Color(val: 0xff4704).with(a: 0.33))
        let items = adjustedData.map{_ in Group()}
        
        animations = items.enumerated().map { (i: Int, item: Group) in
            item.contentsVar.animation(delay: Double(i) * 0.1) { t in
                let height = adjustedData[i]*t
                let rect = Rect(x: Double(i)*50+25, y: 200-height, w: 30, h: height)
                return [rect.fill(with: fill)]
            }
        }
        return items.group()
    }

    static func playAnimations(){
        animations.combine().play()
    }
    /*static func createDummyData()-> [SwiftNewsVideo]{
        var x: SwiftNewsVideo
        var oneArray = [SwiftNewsVideo]()
        /*oneArray = [SwiftNewsVideo.init(showNumber: "xx", viewCount: 5678),
        SwiftNewsVideo.init(showNumber: "xx", viewCount: 2467),
        SwiftNewsVideo.init(showNumber: "xx", viewCount: 3456),
        SwiftNewsVideo.init(showNumber: "xx", viewCount: 6000)]*/
        if(I == 100){
            for k in 0...i-1{
                x = SwiftNewsVideo.init(showNumber:data100ForCalculate[k].name , viewCount:data100ForCalculate[k].grade!*60)
                oneArray.append(x)
            }
        }
        /*if(I == 20){
            for k in 0...i-1{
                x = SwiftNewsVideo.init(showNumber:data100ForCalculate[k].name , viewCount:data100ForCalculate[k].grade!*300)
                oneArray.append(x)
            }
        }
        if(I == 10){
            for k in 0...i-1{
                x = SwiftNewsVideo.init(showNumber:data100ForCalculate[k].name , viewCount:data100ForCalculate[k].grade!*600)
                oneArray.append(x)
            }
        }
        if(I == 6){
            for k in 0...i-1{
                x = SwiftNewsVideo.init(showNumber:data100ForCalculate[k].name , viewCount:data100ForCalculate[k].grade!*1000)
                oneArray.append(x)
            }
        }*/
        /*let one = SwiftNewsVideo(showNumber: "55", viewCount: 3456)
        let one1 = SwiftNewsVideo(showNumber: "56", viewCount: 4444)
        let one2 = SwiftNewsVideo(showNumber: "57", viewCount: 6000)
        let one3 = SwiftNewsVideo(showNumber: "58", viewCount: 3586)
        return [one,one1,one2,one3]*/
        return oneArray
    }*/
 }
 
 
