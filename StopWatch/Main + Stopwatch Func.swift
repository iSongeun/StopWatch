//
//  Main + Stopwatch Func.swift
//  StopWatch
//
//  Created by 이송은 on 2023/04/24.
//

import Foundation

extension MainViewController {
    func start(){
        startTime = Date()
        middleStartTime = startTime
        registerTimer()
    }
    
    func stop(){
        stopTime = Date()
        timer?.invalidate()
        timer = nil
    }
    
    func resume(){
        if let elapsedStopTime = stopTime?.timeIntervalSinceNow{
            startTime = startTime?.addingTimeInterval(elapsedStopTime * -1)
            registerTimer()
        }
        
    }
    
    func reset(){
        timeLabel.text = "00:00.00"
        lapList = []
        tableView.reloadData()
    }
    func lap(){
//        lapList.append(elapsedMiddleTime())
        lapList.insert(elapsedMiddleTime(), at: 0)
        middleStartTime = Date()
        tableView.reloadData()
    }
}
