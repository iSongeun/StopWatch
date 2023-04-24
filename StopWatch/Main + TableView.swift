//
//  Main + TableView.swift
//  StopWatch
//
//  Created by 이송은 on 2023/04/18.
//

import Foundation
import UIKit

extension MainViewController : UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        
        return lapList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeCell", for: indexPath) as! TimeCell
        
        cell.rememberRow = indexPath.row
        
        if indexPath.section == 0{
            if indexPath.row == 0{
                self.timeCell = cell
            }
            cell.titleLabel.text = "기록 " + (lapList.count + 1 ).description
            
            if lapList.count == 0{
                cell.timeLabel.text = "0"
            }
        }
        else if indexPath.section == 1 {
            cell.timeLabel.text = lapList[indexPath.row]
            cell.titleLabel.text = "기록 " + (lapList.count - indexPath.row).description
        }
        
        
        return cell
    }
    
    
}
