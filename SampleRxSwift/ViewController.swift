//
//  ViewController.swift
//  SampleRxSwift
//
//  Created by Rin on 2022/05/13.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var num1TextField: UITextField!
    @IBOutlet weak var num2TextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    let viewModel: ViewModelType = ViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.output.result
            .bind(to: resultLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    @IBAction func didTapCalculateButton(_ sender: UIButton) {
        viewModel.input.didTapCalculateButton(
            num1: num1TextField.text ?? "",
            num2: num2TextField.text ?? ""
        )
    }
}

