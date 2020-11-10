//
//  ViewController.swift
//  BankAppMDA
//
//  Created by Дмитрий Данилин on 09.11.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountLabel: UILabel?
    
    var amount = 9999.99 {
        didSet {
            updateAmountLabel()
        }
    }
    
    func updateAmountLabel() {
        // Задаём стиль amountLabel
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
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


}

