//
//  tf_mars_appTests.swift
//  tf-mars-appTests
//
//  Created by Hoang Duc Nguyen on 01.03.19.
//  Copyright © 2019 Hoang Duc Nguyen. All rights reserved.
//

import XCTest
@testable import tf_mars_app

class tf_mars_appTests: XCTestCase {
    
    let tfmPropertyModels = TFMBoard()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Number of cells
    
    func testNumberOfCells() {
        // WHEN
        let result = tfmPropertyModels.tfmProperties.count
        let expectedNumber = 6
        
        // THEN
        XCTAssertEqual(result, expectedNumber)
    }
    
    // MARK: - Minimum production
    
    func testMinimumProductionNumberMegaCredit() {
        // WHEN
        let result = TFMPropertyModel(type: .megaCredit).minimumProductionNumber
        let expectedNumber = -10
        
        // THEN
        XCTAssertEqual(result, Double(expectedNumber))
    }

    func testMinimumProductionNumberSteel() {
        // WHEN
        let result = TFMPropertyModel(type: .steel).minimumProductionNumber
        let expectedNumber = 0
        
        // THEN
        XCTAssertEqual(result, Double(expectedNumber))
    }
    
    func testMinimumProductionNumberTitan() {
        // WHEN
        let result = TFMPropertyModel(type: .titan).minimumProductionNumber
        let expectedNumber = 0
        
        // THEN
        XCTAssertEqual(result, Double(expectedNumber))
    }
    
    func testMinimumProductionNumberPlant() {
        // WHEN
        let result = TFMPropertyModel(type: .plant).minimumProductionNumber
        let expectedNumber = 0
        
        // THEN
        XCTAssertEqual(result, Double(expectedNumber))
    }
    
    func testMinimumProductionNumberEnergy() {
        // WHEN
        let result = TFMPropertyModel(type: .energy).minimumProductionNumber
        let expectedNumber = 0
        
        // THEN
        XCTAssertEqual(result, Double(expectedNumber))
    }
    
    func testMinimumProductionNumberHeat() {
        // WHEN
        let result = TFMPropertyModel(type: .heat).minimumProductionNumber
        let expectedNumber = 0
        
        // THEN
        XCTAssertEqual(result, Double(expectedNumber))
    }
    
    // MARK: - Maximum production

    func testMaximumProductionValue() {
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


    func testNextGenProperties() {
        // WHEN
        let container = TFMBoard()
        let expectedResult = 20

        for (index, element) in container.tfmProperties.enumerated() {
            if element.isHeat || element.isEnergy {
                continue
            }

            container.tfmProperties[index].quantity = 10
            container.tfmProperties[index].productionFactor = 10
        }

        let nextGenProperties = container.recalculateQuantity(container.tfmProperties)

        nextGenProperties.forEach { property in
            if isEnergyOrHeat(property) {
                return
            }

            let result = property.quantity
            XCTAssertEqual(result, expectedResult)
        }

    }

    func testNextGenEnergy() {
        // WHEN
        let container = TFMBoard()
        let expectedResult = 20

        // Energy is on index 4
        container.tfmProperties[4].quantity = 10
        container.tfmProperties[4].productionFactor = 20

        let nextGenProperties = container.recalculateQuantity(container.tfmProperties)

        let result = nextGenProperties[4].quantity

        // THEN
        XCTAssertEqual(result, expectedResult)
    }

    func testNextGenHeat() {
        // WHEN
        let container = TFMBoard()
        let expectedResult = 30

        // Heat is on index 5
        container.tfmProperties[4].quantity = 10
        container.tfmProperties[5].quantity = 10
        container.tfmProperties[5].productionFactor = 10

        let nextGenProperties = container.recalculateQuantity(container.tfmProperties)

        let result = nextGenProperties[5].quantity

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
