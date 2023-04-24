//
//  StopWatchType.swift
//  StopWatch
//
//  Created by 이송은 on 2023/04/18.
//

import Foundation

enum StopWatchType : String{
    case start = "시작"
    case stop = "정지"
    case resume = "재시작"
    case reset = "초기화"
    
    enum LapResetType : String {
        case lap = "기록"
        case reset = "초기화"
        case disable = "----"
    }
    
    var lapResetType : LapResetType {
        switch self {
        case .start:
            return .lap
        case .stop:
            return .reset
        case .resume:
            return .lap
        case .reset:
            return .disable
        }
    }
}



extension StopWatchType{
    var possibleType : StopWatchType {
        switch self {
        case .start:
            return .stop
        case .stop:
            return .resume
        case .resume:
            return .stop
        case .reset:
            return .start
        }
    }
    //자기 자신 바꾸는 거라 mutating 있어야 함
    mutating func runPossibleType(){
        self = self.possibleType
    }
    
    func possibleButtonTitle() -> String {
        possibleType.rawValue
    }
    var lapResetTitle : String {
        lapResetType.rawValue
    }
}
