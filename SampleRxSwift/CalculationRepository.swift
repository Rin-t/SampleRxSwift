//
//  CalculationRepository.swift
//  SampleRxSwift
//
//  Created by Rin on 2022/05/16.
//

import Foundation
import RxSwift

struct CalculationRepository: CalculationRepositoryProtocol {
    func calculate(num1: Int, num2: Int) -> Single<Int> {
        return Single.just(num1 + num2)
    }
}
