//
//  Double+asCurrency.swift
//  BankAppMDA
//
//  Created by Дмитрий Данилин on 10.11.2020.
//

import Foundation

extension Double {
    func asCurrency(_ symbol: String = "₽") -> String? {
        // Задаём стиль amountLabel на валютный
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        // Присваиваем значение валюты
        formatter.currencySymbol = symbol
        
        let number = NSNumber(value: self)
        return formatter.string(from: number)
    }
}
