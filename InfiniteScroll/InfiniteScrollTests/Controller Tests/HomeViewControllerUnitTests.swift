//
//  HomeViewControllerUnitTests.swift
//  InfiniteScrollTests
//
//  Created by Anirudh Das on 7/7/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import XCTest
import SDWebImage
import SwiftyJSON
@testable import InfiniteScroll

class HomeViewControllerUnitTests: XCTestCase {
    
    var homeVC: HomeViewController!
    let urlArray: [String] = ["https://cdn.pixabay.com/photo/2018/07/04/23/17/soap-bubbles-3517247_150.jpg",
                              "https://cdn.pixabay.com/photo/2018/07/04/22/55/fantasy-3517206_150.jpg",
                              "https://cdn.pixabay.com/photo/2018/07/02/22/18/sunflower-3512654_150.jpg",
                              "https://cdn.pixabay.com/photo/2018/07/04/22/55/fantasy-3517206_150.jpg"]
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.homeVCStoryboardID) as! HomeViewController
        _ = homeVC.view
        //homeVC = HomeViewController(pixlrService: PixlrService(apiURL: ServerConfiguration.apiBaseUrl))
    }
}

// MARK: - Tests for Alert
extension HomeViewControllerUnitTests {
    func testInValidInputForTextField() {
        performOperationOnMainAfterDelay(delayTimeInSeconds: 2) {
            XCTAssertFalse(self.homeVC.checkIfValidInput(), "Empty Input")
        }
    }
    
    func testValidInputForTextField() {
        performOperationOnMainAfterDelay(delayTimeInSeconds: 2) {
            self.homeVC.nameTxtFld.text = "Anirudh"
            XCTAssertTrue(self.homeVC.checkIfValidInput(), "Empty Input")
        }
    }
    
    func testIfDidShowValidAlert() {
        performOperationOnMainAfterDelay(delayTimeInSeconds: 2) {
            self.homeVC.handleStartClick()
            let exp = self.expectation(description: "Show AlertView Controller on NO Input")
            performOperationOnMainAfterDelay(delayTimeInSeconds: 2) {
                // access root view controller
                let root = UIApplication.shared.keyWindow?.rootViewController
                // check if it presented AlertController or not
                XCTAssertTrue(root!.presentedViewController! is UIAlertController)
                // access alertController
                let alertController = root!.presentedViewController as! UIAlertController
                // Check if it has valid title or not
                XCTAssertEqual(alertController.title, Constants.alertTitle)
                // Check if it has valid message or nots
                XCTAssertEqual(alertController.message, Constants.alertMessage)
                // Check if it has valid number of actions or not
                let actions = alertController.actions
                XCTAssertTrue(actions.count == 1)
                // Check if actions has valid titles or not
                XCTAssertEqual(actions[0].title, "OK")
                exp.fulfill()
            }
            self.waitForExpectations(timeout: 5, handler: nil)
        }
    }
    
    func testIfDidNotShowAlert() {
        performOperationOnMainAfterDelay(delayTimeInSeconds: 2) {
            self.homeVC.nameTxtFld.text = "Anirudh"
            self.homeVC.handleStartClick()
            let exp = self.expectation(description: "No AlertView Controller shown")
            performOperationOnMainAfterDelay(delayTimeInSeconds: 2) {
                // access root view controller
                let root = UIApplication.shared.keyWindow?.rootViewController
                // check if it presented AlertController or not
                XCTAssertFalse(root!.presentedViewController! is UIAlertController)
                exp.fulfill()
            }
            self.waitForExpectations(timeout: 5, handler: nil)
        }
    }
}

// MARK: - Tests for Caching
extension HomeViewControllerUnitTests {
    func testAddImagesFromCache() {
        SDImageCache.shared().clearDisk(onCompletion: {
            XCTAssertEqual(SDImageCache.shared().getSize(), 0)
            for urlStr in self.urlArray {
                if let imgURL = NSURL(string: urlStr) {
                    UIImageView().sd_setImage(with: imgURL as URL!, completed: { (image, _, _, _) in
                        XCTAssertNotNil(image)
                        XCTAssertGreaterThan(SDImageCache.shared().getSize(), 0)
                    })
                }
            }
        })
    }
    
    /*
    func testRemoveImagesFromCache() {
        //Assume there are already these images cached. Or run the app once, before executing.
        let initialSize = SDImageCache.shared().getSize()
        XCTAssertGreaterThan(initialSize, 0)
        
        var imagesArray: [PixlrImage] = []
        
        let dict1: [String: Any] = ["id": 1234, "webformatURL": "https://pixabay.com/get/ea30b0082af4073ed1584d05fb1d4f92eb73ebd01fac104496f0c87ea0efb5be_640.jpg",
                                    "previewURL": urlArray[0]]
        let json1 = JSON(parseJSON: dict1.toJSONString())
        let image1 = PixlrImage(json: json1, pageNumber: 1)
        imagesArray.append(image1!)
        
        let dict2: [String: Any] = ["id": 1234, "webformatURL": "https://pixabay.com/get/ea30b0082af4073ed1584d05fb1d4f92eb73ebd01fac104496f0c87ea0efb5be_640.jpg",
                                    "previewURL": urlArray[1]]
        let json2 = JSON(parseJSON: dict2.toJSONString())
        let image2 = PixlrImage(json: json2, pageNumber: 1)
        imagesArray.append(image2!)
        
        homeVC.removeImagesFromCache(images: imagesArray, completionBlock: {
            XCTAssertLessThan(SDImageCache.shared().getSize(), initialSize)
        })
    }
    */
}

// MARK: - Tests for Collection View
extension HomeViewControllerUnitTests {
    func testCollectionViewShouldNotBeNil() {
        XCTAssertNotNil(homeVC.imagesCollectionView)
    }
    
    func testCollectionViewDataSourceAndDelegateShouldNotBeNil() {
        XCTAssertNotNil(homeVC.imagesCollectionView.dataSource)
        XCTAssertNotNil(homeVC.imagesCollectionView.delegate)
    }
    
    func testCollectionViewIsSetAsDelegateAndDataSource() {
        XCTAssertNotNil(homeVC.imagesCollectionView.dataSource is HomeViewController)
        XCTAssertNotNil(homeVC.imagesCollectionView.delegate is HomeViewController)
    }
    
    func testCollectionViewHasSingleDataServiceObject() {
        XCTAssertEqual(homeVC.imagesCollectionView.dataSource is HomeViewController, homeVC.imagesCollectionView.delegate is HomeViewController)
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(homeVC.imagesCollectionView.numberOfSections, 1)
        XCTAssertNotEqual(homeVC.imagesCollectionView.numberOfSections, 2)
    }
    
    func testNumberOfItemsInSection() {
        homeVC.imagesCollectionView.isHidden = false
        
        let dict1: [String: Any] = ["id": 1234, "webformatURL": "https://pixabay.com/get/ea30b0082af4073ed1584d05fb1d4f92eb73ebd01fac104496f0c87ea0efb5be_640.jpg",
                                    "previewURL": urlArray[0]]
        let json1 = JSON(parseJSON: dict1.toJSONString())
        let image1 = PixlrImage(json: json1, pageNumber: 1)
        homeVC.pixlrImageArray.append(image1!)
        
        homeVC.imagesCollectionView.reloadData()
        XCTAssertEqual(homeVC.imagesCollectionView.numberOfItems(inSection: 0), 1)
        
        let dict2: [String: Any] = ["id": 1234, "webformatURL": "https://pixabay.com/get/ea30b0082af4073ed1584d05fb1d4f92eb73ebd01fac104496f0c87ea0efb5be_640.jpg",
                                    "previewURL": urlArray[1]]
        let json2 = JSON(parseJSON: dict2.toJSONString())
        let image2 = PixlrImage(json: json2, pageNumber: 1)
        homeVC.pixlrImageArray.append(image2!)
        
        homeVC.imagesCollectionView.reloadData()
        XCTAssertEqual(homeVC.imagesCollectionView.numberOfItems(inSection: 0), 2)
    }
    
    func testCellForItemAtIndexPathReturnsImageCollectionViewCell() {
        homeVC.imagesCollectionView.isHidden = false
        
        let dict1: [String: Any] = ["id": 1234, "webformatURL": "https://pixabay.com/get/ea30b0082af4073ed1584d05fb1d4f92eb73ebd01fac104496f0c87ea0efb5be_640.jpg",
                                    "previewURL": urlArray[0]]
        let json1 = JSON(parseJSON: dict1.toJSONString())
        let image1 = PixlrImage(json: json1, pageNumber: 1)
        homeVC.pixlrImageArray.append(image1!)
        
        homeVC.imagesCollectionView.reloadData()
        
        let cellQueried = homeVC.imagesCollectionView.cellForItem(at: IndexPath(row: 0, section: 0))
        XCTAssertFalse(cellQueried is MockImageCollectionViewCell)
    }
    
    /*
    func testCollectionViewShouldDequeueCell() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 111, height: 111)
        
        let mock = CollectionViewMock(frame: homeVC.view.frame, collectionViewLayout: layout)
        mock.dataSource = homeVC
        mock.delegate = homeVC
        mock.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: Constants.imageCellReuseIdentifier)
        
        let dict1: [String: Any] = ["id": 1234, "webformatURL": "https://pixabay.com/get/ea30b0082af4073ed1584d05fb1d4f92eb73ebd01fac104496f0c87ea0efb5be_640.jpg",
                                    "previewURL": urlArray[0]]
        let json1 = JSON(parseJSON: dict1.toJSONString())
        let image1 = PixlrImage(json: json1, pageNumber: 1)
        homeVC.pixlrImageArray.append(image1!)
        
        mock.reloadData()
        _ = mock.cellForItem(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mock.cellDequeuedProperly)
    }
    */
}
