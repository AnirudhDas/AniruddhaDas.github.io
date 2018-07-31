//
//  Constants.swift
//  InfiniteScroll
//
//  Created by Anirudh Das on 7/6/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import UIKit

/**
 Defines all constant values to be used in app
 */
struct Constants {
    public static let placeholderImage: UIImage = #imageLiteral(resourceName: "placeholder")
    public static let spinnerMessage = "Please wait..."
    public static let footerViewReuseIdentifier = "RefreshFooterView"
    public static let imageCellReuseIdentifier = "ImageCell"
    public static let dateFormat = "E, d MMM yyyy HH:mm:ss.SS a"
    public static let alertTitle = "Invalid Entry!"
    public static let alertMessage = "Please enter a name to continue"
    public static let footerViewXibName = "CustomFooterView"
    public static let homeVCStoryboardID = "HomeVC"
    public static let cellBuffer: CGFloat = 6
    public static let maxNumberOfImagesAtATime = 500
    public static let maxNumberOfItemsToBeFreed = ServerConfiguration.imagesPerPage * 5
}
