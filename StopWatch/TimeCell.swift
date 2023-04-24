//
//  TimeCell.swift
//  StopWatch
//
//  Created by 이송은 on 2023/04/18.
//

import UIKit

class TimeCell : UITableViewCell {
    var rememberRow = 0
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .systemGray6
    }
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
}
