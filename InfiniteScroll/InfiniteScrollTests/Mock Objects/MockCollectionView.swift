//
//  MockCollectionView.swift
//  InfiniteScrollTests
//
//  Created by Anirudh Das on 7/8/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import UIKit

class MockImageCollectionViewCell: UICollectionViewCell {
    
}

class CollectionViewMock: UICollectionView {
    var cellDequeuedProperly = false
    
    override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        cellDequeuedProperly = true
        return super.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
    }
}
