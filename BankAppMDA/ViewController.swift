//
//  ViewController.swift
//  BankAppMDA
//
//  Created by Дмитрий Данилин on 09.11.2020.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlrts
    @IBOutlet weak var amountLabel: UILabel?
    @IBOutlet weak var monthlyPaymentLabel: UILabel?
    
    
    @IBOutlet weak var pvTextField: UITextField?
    @IBOutlet weak var nperTextField: UITextField?
    @IBOutlet weak var rateTextField: UITextField?
    
    // MARK: - Properties
    var amount = 9999.99 {
        // Обновляем значение amountLabel после внесения изменений
        didSet {
            updateAmountLabel()
        }
    }
    
    // MARK: - Methods
    // Убираем клавиатуру касаясь любой части экрана
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func updateAmountLabel() {
        // Задаём стиль amountLabel на валютный
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        // Присваиваем значение валюты
        formatter.currencySymbol = "₽"
        
        let number = NSNumber(value: amount)
        amountLabel?.text = formatter.string(from: number)
    }
    
    func updateMonthlyAmountLabel() {
        monthlyPaymentLabel?.text = "0.00"
        
        guard let pv = Double(pvTextField?.text ?? "") else { return }
        guard let nper = Double(nperTextField?.text ?? "") else { return }
        guard let rate = Double(rateTextField?.text ?? "") else { return }
        
        let monthlyPayment = abs(ExcelFormulas.pmt(rate: rate / 100 / 12, nper: nper, pv: pv)) // abs это функция значения по модулю
        monthlyPaymentLabel?.text = "\(monthlyPayment)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateAmountLabel()
        updateMonthlyAmountLabel()
    }
    
    // MARK: - Actions
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        print(sender.text ?? "nil")
        updateMonthlyAmountLabel()
    }
}

