//
//  CalculationUseCase.swift
//  SampleRxSwift
//
//  Created by Rin on 2022/05/16.
//

import Foundation
import RxSwift

protocol CalculationRepositoryProtocol {
    func calculate(num1: Int, num2: Int) -> Single<Int>
}

final class CalculationUseCase {

    private let repository: CalculationRepositoryProtocol

    init(repository: CalculationRepositoryProtocol) {
        self.repository = repository
    }

    func calculate(num1: Int, num2: Int) -> Single<Int> {
        return repository.calculate(num1: num1, num2: num2)
    }
}
