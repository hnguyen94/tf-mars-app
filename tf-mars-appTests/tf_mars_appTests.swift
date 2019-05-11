import XCTest
@testable import tf_mars_app

class AppTests: XCTestCase {

  let tfmPropertyModels = TFMBoard()

  override func setUp() {
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }

  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }

  // MARK: - Number of cells
  
  func test_NumberOfCells() {
    // WHEN
    let result = tfmPropertyModels.tfmProperties.count
    let expectedNumber = 6
    
    // THEN
    XCTAssertEqual(result, expectedNumber)
  }
  
  // MARK: - Minimum production
  
  func test_MinimumProductionNumberMegaCredit() {
    // WHEN
    let result = TFMPropertyModel(type: .megaCredit).minimumProductionNumber
    let expectedNumber = -10
    
    // THEN
    XCTAssertEqual(result, Double(expectedNumber))
  }

  func test_MinimumProductionNumberSteel() {
    // WHEN
    let result = TFMPropertyModel(type: .steel).minimumProductionNumber
    let expectedNumber = 0
    
    // THEN
    XCTAssertEqual(result, Double(expectedNumber))
  }
  
  func test_MinimumProductionNumberTitan() {
    // WHEN
    let result = TFMPropertyModel(type: .titan).minimumProductionNumber
    let expectedNumber = 0
    
    // THEN
    XCTAssertEqual(result, Double(expectedNumber))
  }
  
  func test_MinimumProductionNumberPlant() {
    // WHEN
    let result = TFMPropertyModel(type: .plant).minimumProductionNumber
    let expectedNumber = 0
    
    // THEN
    XCTAssertEqual(result, Double(expectedNumber))
  }
  
  func test_MinimumProductionNumberEnergy() {
    // WHEN
    let result = TFMPropertyModel(type: .energy).minimumProductionNumber
    let expectedNumber = 0
    
    // THEN
    XCTAssertEqual(result, Double(expectedNumber))
  }
  
  func test_MinimumProductionNumberHeat() {
    // WHEN
    let result = TFMPropertyModel(type: .heat).minimumProductionNumber
    let expectedNumber = 0
    
    // THEN
    XCTAssertEqual(result, Double(expectedNumber))
  }
  
  // MARK: - Maximum production
  
  func test_MaximumProductionValue() {
    // WHEN
    let resultList = tfmPropertyModels.tfmProperties
    
    resultList.forEach { model in
      let result = model.maximumProductionNumber
      let expectedNumber = 30
      
      // THEN
      XCTAssertEqual(result, Double(expectedNumber))
    }
  }
  
  // MARK: - Minimum quantity
  
  // MARK: - Next Generation Button
  
  func test_NextGenProperties() {
    // WHEN
    let container = TFMBoard()
    let expectedResult = 20
    
    for (index, element) in container.tfmProperties.enumerated() {
      if element.isHeat || element.isEnergy || element.isMegaCredit {
        continue
      }
      
      container.tfmProperties[index].quantity = 10
      container.tfmProperties[index].productionFactor = 10
    }
    
    let nextGenProperties = container.recalculateQuantity(container.tfmProperties, with: container.terraForm)
    
    nextGenProperties.forEach { property in
      if property.isEnergy || property.isHeat {
        return
      }

      let result = property.quantity
      XCTAssertEqual(result, expectedResult)
    }
    
  }
  
  func test_NextGenMegaCredit() {
    // WHEN
    let container = TFMBoard()
    container.terraForm = 20
    let expectedResult = 50
    
    // MegaCredit is on index 0
    container.tfmProperties[0].quantity = 10
    container.tfmProperties[0].productionFactor = 20
    
    let nextGenProperties = container.recalculateQuantity(container.tfmProperties,
                                                          with: container.terraForm)
    
    let result = nextGenProperties[0].quantity
    
    // THEN
    XCTAssertEqual(result, expectedResult)
  }

  func test_NextGenEnergy() {
    // WHEN
    let container = TFMBoard()
    let expectedResult = 20
    
    // Energy is on index 4
    container.tfmProperties[4].quantity = 10
    container.tfmProperties[4].productionFactor = 20
    
    let nextGenProperties = container.recalculateQuantity(container.tfmProperties,
                                                          with: container.terraForm)
    
    let result = nextGenProperties[4].quantity
    
    // THEN
    XCTAssertEqual(result, expectedResult)
  }
  
  func test_NextGenHeat() {
    // WHEN
    let container = TFMBoard()
    let expectedResult = 30
    
    // Heat is on index 5
    container.tfmProperties[4].quantity = 10
    container.tfmProperties[5].quantity = 10
    container.tfmProperties[5].productionFactor = 10
    
    let nextGenProperties = container.recalculateQuantity(container.tfmProperties,
                                                          with: container.terraForm)
    
    let result = nextGenProperties[5].quantity
    
    // THEN
    XCTAssertEqual(result, expectedResult)
  }
  
  func test_ResetBoard() {
    // WHEN
    let board = TFMBoard()
    let expectedGeneration = 0
    let expectedTerraForm = 20
    
    board.generation = 45
    board.terraForm = 45
    board.makeReset()

    // THEN
    XCTAssertEqual(board.generation, expectedGeneration)
    XCTAssertEqual(board.terraForm, expectedTerraForm)
  }

  func testPerformanceExample() {
    // This is an example of a performance test case.
    self.measure {
      // Put the code you want to measure the time of here.
    }
  }
  
}
