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
//        return Single.just(num1 + num2)
//
//        return Single.create { single in
//
//            DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
//                single(.success(num1 + num2))
//            })
//
//            return Disposables.create()
//        }

        return Single.just(num1 + num2)
            .delay(.seconds(5), scheduler: MainScheduler.instance)
    }
}
