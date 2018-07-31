import XCTest
@testable import GuessImageGame

/**
 Unit Tests for Service Call
 */
class GuessImageViewControllerUnitTests: XCTestCase {
    
    var guessImageViewController: GuessImageViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFlickrAPIWithCorrectURLAndExpectationOfFlickPhotos() {
        guessImageViewController = GuessImageViewController(flickerService: MockFlickImageService(apiURL: ServerConfiguration.apiFetchPhotos + "?format=json&nojsoncallback=1"))
        // create expectation
        let exp = expectation(description: "Array of Flickr Photos")
        guessImageViewController.fetchImages { (flickPhotosArray) in
            if let _ = flickPhotosArray as? [FlickrPhoto] {
                exp.fulfill()
            } else {
                XCTFail("Webservice failed to respond with Array of Flickr Photos in 30 seconds with CorrectURL")
            }
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testFlickrAPIWithExpectedResponseTime() {
        guessImageViewController = GuessImageViewController(flickerService: MockFlickImageService(apiURL: ServerConfiguration.apiFetchPhotos + "?format=json&nojsoncallback=1"))
        // create expectation
        let exp = expectation(description: "Array of Flickr Photos in 0.1 seconds")
        guessImageViewController.fetchImages { (flickPhotosArray) in
            if let _ = flickPhotosArray as? [FlickrPhoto] {
                exp.fulfill()
            } else {
                XCTFail("Webservice failed to response in 0.1 second")
            }
        }
        //Expected Response Time is 0.1 seconds
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testFlickrAPIWithCorrectURLAndExpectationOfMockPhoto() {
        guessImageViewController = GuessImageViewController(flickerService: MockFlickImageService(apiURL: ServerConfiguration.apiFetchPhotos + "?format=json&nojsoncallback=1"))
        // create expectation
        let exp = expectation(description: "Array of Mock Photos")
        guessImageViewController.fetchImages { (mockPhotosArray) in
            if let _ = mockPhotosArray as? [MockPhoto] {
                exp.fulfill()
            } else {
                XCTFail("Webservice failed to respond with array of MockPhotos")
            }
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testFlickrAPIWithIncorrectURL() {
        guessImageViewController = GuessImageViewController(flickerService: MockFlickImageService(apiURL: "https://www.incorrect.com/dummyURL"))
        // create expectation
        let exp = expectation(description: "Array of Flickr Photos")
        guessImageViewController.fetchImages { (flickPhotosArray) in
            if flickPhotosArray != nil {
                exp.fulfill()
            } else {
                XCTFail("Webservice failed")
            }
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testPerformanceOfAPICall() {
        self.measure {
            // Put the code you want to measure the time of here.
            guessImageViewController = GuessImageViewController(flickerService: MockFlickImageService(apiURL: ServerConfiguration.apiFetchPhotos + "?format=json&nojsoncallback=1"))
            guessImageViewController.fetchImages { (flickPhotosArray) in
                if let _ = flickPhotosArray as? [FlickrPhoto] {
                    
                } else {
                   
                }
            }
        }
    }
}
