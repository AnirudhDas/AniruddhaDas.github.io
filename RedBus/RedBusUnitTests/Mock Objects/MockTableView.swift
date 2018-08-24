//
//  MockTableView.swift
//  RedBusUnitTests
//
//  Created by Anirudh Das on 8/24/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import UIKit

class MockBusTableViewCell: UITableViewCell {
    
}

class MockTableView: UITableView {
    var cellDequeuedProperly = false
    
    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        cellDequeuedProperly = true
        return super.dequeueReusableCell(withIdentifier: identifier)
    }
}
