//
//  ProductViewModel.swift
//  DummyTests
//
//  Created by Khalil on 6/11/23.
//
import XCTest
import Foundation
@testable import Dummy

class ProductViewModelTests: XCTestCase {
    
    func testWithNoProducts() {
        let sut = makeSut()
        sut.products = []
        XCTAssertEqual(sut.products.count, 0)
    }
    
    func testWithProducts() {
        let sut = makeSut()
        sut.products = [Product(id: 4, title: "t1", description: "d1", price: 5, discountPercentage: 9.0, rating: 4.0, stock: 9, brand: "R1", category: "C1", images: ["1"]), Product(id: 2, title: "T2", description: "D2", price: 4, discountPercentage: 5.4, rating: 4.9, stock: 5, brand: "B2", category: "C2", images: ["IM"])]
        XCTAssertEqual(sut.products.count, 2)
    }
    
    
    
    
    
    // MARK: Helper
    func makeSut() -> ProductViewModel {
        let sut = ProductViewModel()
        return sut
    }
}
