//
//  SampleRxSwiftTests.swift
//  SampleRxSwiftTests
//
//  Created by Rin on 2022/05/13.
//

import XCTest
import RxSwift
@testable import SampleRxSwift

class SampleRxSwiftTests: XCTestCase {

    private let disposeBag = DisposeBag()

    func testExample() throws {
        struct Repository: CalculationRepositoryProtocol {
            func calculate(num1: Int, num2: Int) -> Single<Int> {
                return Single.just(num1 + num2)
            }
        }

        let useCase = CalculationUseCase(repository: Repository())

        useCase.calculate(num1: 10, num2: 20)
            .subscribe { sum in
                XCTAssertEqual(sum, 30)
            } onFailure: { _ in
                XCTFail()
            }
            .disposed(by: disposeBag)
    }

}
