//
//  BusesListVCUnitTests.swift
//  RedBusUnitTests
//
//  Created by Anirudh Das on 8/24/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import XCTest
import SDWebImage
import SwiftyJSON
@testable import RedBus

class BusesListVCUnitTests: XCTestCase {
    
    var busesListVC: BusesListViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        busesListVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.busesListVC) as! BusesListViewController
        _ = busesListVC.view
    }
}

// MARK: - Tests for Collection View
extension BusesListVCUnitTests {
    func testTableViewShouldNotBeNil() {
        XCTAssertNotNil(busesListVC.tableView)
    }
    
    func testTableViewDataSourceAndDelegateShouldNotBeNil() {
        XCTAssertNotNil(busesListVC.tableView.dataSource)
        XCTAssertNotNil(busesListVC.tableView.delegate)
    }
    
    func testTableViewIsSetAsDelegateAndDataSource() {
        XCTAssertNotNil(busesListVC.tableView.dataSource is BusesListViewController)
        XCTAssertNotNil(busesListVC.tableView.delegate is BusesListViewController)
    }
    
    func testTableViewHasSingleDataServiceObject() {
        XCTAssertEqual(busesListVC.tableView.dataSource is BusesListViewController, busesListVC.tableView.delegate is BusesListViewController)
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(busesListVC.tableView.numberOfSections, 1)
        XCTAssertNotEqual(busesListVC.tableView.numberOfSections, 2)
    }
    
    func testNumberOfItemsInSection() {
        let bundle = Bundle(for: type(of: self))
        guard let path1 = bundle.path(forResource: "Bus1", ofType: "json"), let data1 = try? Data.init(contentsOf: URL.init(fileURLWithPath: path1)), let path2 = bundle.path(forResource: "Bus2", ofType: "json"), let data2 = try? Data.init(contentsOf: URL.init(fileURLWithPath: path2)) else {
           return
        }
        busesListVC.tableView.isHidden = false
        let json1 = JSON(data: data1)
        let json2 = JSON(data: data2)
        let bus1: BusDetail! = BusDetail(json1, logoBaseURL: "busLogoBaseURL")
        let bus2: BusDetail! = BusDetail(json2, logoBaseURL: "busLogoBaseURL")
        
        busesListVC.busesList.allBuses = [bus1]
        
        busesListVC.tableView.reloadData()
        
        XCTAssertEqual(busesListVC.tableView.numberOfRows(inSection: 0), 1)
        
        busesListVC.busesList.allBuses = [bus1, bus2]
        
        busesListVC.tableView.reloadData()
        XCTAssertEqual(busesListVC.tableView.numberOfRows(inSection: 0), 2)
    }
    
    func testCellForItemAtIndexPathReturnsImageCollectionViewCell() {
        let bundle = Bundle(for: type(of: self))
        guard let path1 = bundle.path(forResource: "Bus1", ofType: "json"), let data1 = try? Data.init(contentsOf: URL.init(fileURLWithPath: path1)) else {
            return
        }
        busesListVC.tableView.isHidden = false
        let json1 = JSON(data: data1)
        let bus1: BusDetail! = BusDetail(json1, logoBaseURL: "busLogoBaseURL")
        
        busesListVC.busesList.allBuses = [bus1]
        
        busesListVC.tableView.reloadData()
        
        let cellQueried = busesListVC.tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertFalse(cellQueried is MockBusTableViewCell)
    }
}
