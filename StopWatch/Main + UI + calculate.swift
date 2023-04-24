//
//  Main + UI + calculate.swift
//  StopWatch
//
//  Created by 이송은 on 2023/04/24.
//

import Foundation

extension MainViewController {
    
    func setUI(){
        self.navigationItem.title = "Stop Watch"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .systemGray6
        self.view.backgroundColor = .systemGray6
        rightButton.setTitle(watchType.rawValue, for: .normal)
        leftButton.setTitle(watchType.rawValue, for: .normal)
        watchType = .reset
    }
    
    func registerTimer(){
        
        timer = Timer(timeInterval: 0.01, repeats: true, block: { _ in
            
            self.timeLabel.text = self.elapsedTime()
            if self.timeCell?.rememberRow == 0{
                self.timeCell?.timeLabel.text = self.elapsedMiddleTime()
            }
        })
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    
    
    func elapsedTime() -> String {
        let dateFormmatter = DateFormatter()
        dateFormmatter.dateFormat = "mm:ss.SS"
        let interval = (self.startTime?.timeIntervalSinceNow ?? 0) * -1
        let customDate = Date(timeIntervalSinceReferenceDate: interval)
        return dateFormmatter.string(from: customDate).description
    }
    
    func elapsedMiddleTime() -> String {
        let dateFormmatter = DateFormatter()
        dateFormmatter.dateFormat = "mm:ss.SS"
        let interval = (self.middleStartTime?.timeIntervalSinceNow ?? 0) * -1
        let customDate = Date(timeIntervalSinceReferenceDate: interval)
        return dateFormmatter.string(from: customDate).description
    }
    
    func setButtonTitle(){
        rightButton.setTitle(watchType.possibleButtonTitle(), for: .normal)
        leftButton.setTitle(watchType.lapResetTitle, for: .normal)
    }
}

