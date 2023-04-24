//
//  MainViewController.swift
//  StopWatch
//
//  Created by 이송은 on 2023/04/18.
//

import UIKit


class MainViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var watchType = StopWatchType.start {
        //값 변할 때 마다 호출
        didSet{
            switch watchType {
            case .start:
                start()
            case .stop:
                stop()
            case .resume:
                resume()
            case .reset:
                reset()
            }
        }
    }
    var timer : Timer?
    var startTime : Date?
    var stopTime : Date?
    var middleStartTime : Date?
    var lapList : [String] = []
    
    var timeCell : TimeCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        leftButton.setTitle(watchType.lapResetTitle, for: .normal)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func clickLeftButton(_ sender: Any) {
        if watchType.lapResetType == .reset{
            watchType = .reset
        }
        else if watchType.lapResetType == .lap {
            lap()
        }
        setButtonTitle()
    }
    
    @IBAction func clickRightButton(_ sender: Any) {
        watchType.runPossibleType()
        setButtonTitle()
    }
    
}



