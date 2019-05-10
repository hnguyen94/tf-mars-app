import XCTest
@testable import tf_mars_app

class TFMPropertyModelTests: XCTestCase {

  // MARK: - Icon Tests

  func test_iconForMegaCredit() {
    // WHEN
    let result = TFMPropertyModelHelper.makeIcon(from: .megaCredit)
    let expectedResult = #imageLiteral(resourceName: "mega_credit")

    // THEN
    XCTAssertEqual(result, expectedResult)
  }

  func test_iconForSteel() {
    // WHEN
    let result = TFMPropertyModelHelper.makeIcon(from: .steel)
    let expectedResult = #imageLiteral(resourceName: "steel")

    // THEN
    XCTAssertEqual(result, expectedResult)
  }

  func test_iconForTitan() {
    // WHEN
    let result = TFMPropertyModelHelper.makeIcon(from: .titan)
    let expectedResult = #imageLiteral(resourceName: "titan")

    // THEN
    XCTAssertEqual(result, expectedResult)
  }

  func test_iconForPlant() {
    // WHEN
    let result = TFMPropertyModelHelper.makeIcon(from: .plant)
    let expectedResult = #imageLiteral(resourceName: "plant")

    // THEN
    XCTAssertEqual(result, expectedResult)
  }

  func test_iconForEnergy() {
    // WHEN
    let result = TFMPropertyModelHelper.makeIcon(from: .energy)
    let expectedResult = #imageLiteral(resourceName: "energy.pdf")

    // THEN
    XCTAssertEqual(result, expectedResult)
  }

  func test_iconForHeat() {
    // WHEN
    let result = TFMPropertyModelHelper.makeIcon(from: .heat)
    let expectedResult = #imageLiteral(resourceName: "heat.pdf")

    // THEN
    XCTAssertEqual(result, expectedResult)
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }

}
