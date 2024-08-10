//
//  DataUSAVisualizationTests.swift
//  DataUSAVisualizationTests
//
//  Created by Filipe Ramos on 09/08/2024.
//

import XCTest
@testable import DataUSAVisualization

final class DataUSAVisualizationTests: XCTestCase {
    
    var vm: StateDataVM?
    
    override func setUpWithError() throws {
        let service = DataUsaService()
        vm = StateDataVM(service: service)
    }
    
    func testRelativeCalculation_Success() throws {
        vm?.stateData = dummyStateData
        vm?.calculateRelativePopulations()
        
        XCTAssertEqual(vm?.stateData.first?.relativePopulation, 0.5)
    }
    
    func testRelativeCalculation_Fail() throws {
        vm?.stateData = dummyStateData
        vm?.calculateRelativePopulations()
        
        XCTAssertNotEqual(vm?.stateData.last?.relativePopulation, 20)
    }
    
    func testSortAlpha_Success() throws {
        vm?.stateData = dummyStateData
        vm?.sortData()
        
        XCTAssertEqual(vm?.stateData.first?.name, "AAA")
    }
    
    func testSortAlpha_Fail() throws {
        vm?.stateData = dummyStateData
        vm?.sortData()
        
        XCTAssertNotEqual(vm?.stateData.last?.name, "AAA")
    }
    
    func testSortSize_Success() throws {
        vm?.stateData = dummyStateData
        vm?.sortOrder = .populationSize
        vm?.sortData()
        
        XCTAssertEqual(vm?.stateData.first?.population, 200)
    }
    
    func testSortSize_Fail() throws {
        vm?.stateData = dummyStateData
        vm?.sortOrder = .populationSize
        vm?.sortData()
        
        XCTAssertNotEqual(vm?.stateData.last?.population, 200)
    }
    
    func testSwitchSort_Success() throws {
        vm?.stateData = dummyStateData
        vm?.switchSortingOrder()
        
        XCTAssertEqual(vm?.sortOrder, .populationSize)
    }

    func testSwitchSort_Fail() throws {
        vm?.stateData = dummyStateData
        vm?.switchSortingOrder()
        
        XCTAssertNotEqual(vm?.sortOrder, .alphabetically)
    }

}

extension DataUSAVisualizationTests {
    var dummyStateData: [StateData] {
        [
            .init(id: "1", name: "AAA", year: "2024", population: 100),
            .init(id: "2", name: "BBB", year: "2024", population: 10),
            .init(id: "3", name: "CCC", year: "2024", population: 200)
        ]
    }
}
