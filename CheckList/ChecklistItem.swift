//
//  ChecklistItem.swift
//  CheckList
//
//  Created by Oleksiy Petlyuk on 26.11.2019.
//  Copyright © 2019 Oleksiy Petlyuk. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
