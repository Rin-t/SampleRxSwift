//
//  ViewModel.swift
//  SampleRxSwift
//
//  Created by Rin on 2022/05/13.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelOutput {
    var result: Observable<String> { get }
}

protocol ViewModelInput {
    func didTapCalculateButton(num1: String, num2: String)
}

protocol ViewModelType {
    var output: ViewModelOutput { get }
    var input: ViewModelInput { get }
}


final class ViewModel: ViewModelType, ViewModelInput, ViewModelOutput {

    private let disposeBag = DisposeBag()
    private let useCase = CalculationUseCase(repository: CalculationRepository())

    var input: ViewModelInput { return self }
    var output: ViewModelOutput { return self }

    private let resultRelay = BehaviorRelay<String>(value: "")
    var result: Observable<String> {
        resultRelay.asObservable()
    }

    func didTapCalculateButton(num1: String, num2: String) {
        useCase
            .calculate(num1: Int(num1) ?? 0, num2: Int(num2) ?? 0)
            .subscribe { [weak self] result in
                self?.resultRelay.accept(String(result))
            } onFailure: { _ in
                // TODO
            }
            .disposed(by: disposeBag) 
    }

}
