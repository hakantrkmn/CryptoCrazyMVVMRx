//
//  Utility.swift
//  CryptoCrazyMVVMRx
//
//  Created by Hakan Türkmen on 22.12.2023.
//

import Foundation


public class Utility{
    
    static func stringToDecimal(value : String) -> String{
        let num = NSNumber(value: Double(value)!)
        let formatter : NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let str = formatter.string(from: num)!
        return str
    }
}


extension String{
    func DoubleToDecimal() -> String {
        let num = NSNumber(value: Double(self)!)
        let formatter : NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let str = formatter.string(from: num)!
        return str
        }
}

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}
