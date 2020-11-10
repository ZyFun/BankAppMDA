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
    func updateAmountLabel() {
        // Задаём стиль amountLabel на валютный
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        // Присваиваем значение валюты
        formatter.currencySymbol = "₽"
        
        let number = NSNumber(value: amount)
        amountLabel?.text = formatter.string(from: number)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateAmountLabel()
        amount += 1
    }
    
    @IBAction func textFieldEditingChanged(_ sender: UITextField) {
        print(sender.text ?? "nil")
    }
}

