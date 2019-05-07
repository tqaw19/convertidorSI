//
//  Unit.swift
//  ConvertidorSI
//
//  Created by Alejandro Quesada on 7/05/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import Foundation

class Tarea{
    var dato1 = ""
    //        var datos2 = ""
}
enum Unit: Int {
    case millas = 0, yardas, kilometros
    
    static func allCases() -> [String] {
        var i = 0
        var list = [String]()
        while let unit = Unit(rawValue: i) {
            list.append(unit.description())
            i = i + 1
        }
        return list
    }
    
    func description() -> String {
        switch self {
        case .millas:
            return "millas"
        case .yardas:
            return "yardas"
        case .kilometros:
            return "kilometros"
        }
    }
    
    static func fromString(_ string: String) -> Unit? {
        if string == "millas" {
            return .millas
        } else if string == "yardas" {
            return .yardas
        } else if string == "kilometros" {
            return .kilometros
        } else {
            return nil
        }
    }
    
    func convertTo(unit to: Unit, value val: Double) -> Double {
        var constant = 1.0
        switch self {
        case .millas:
            if to == .yardas {
                constant = 1760
            } else if to == .kilometros {
                constant = 1.60934
            }
            
        case .yardas:
            if to == .millas {
                constant = 0.000568182
            } else if to == .kilometros {
                constant = 0.0009144
            }
            
        case .kilometros:
            if to == .yardas {
                constant = 1093.6133;
            } else if to == .millas {
                constant = 0.621371192
            }
        }
        
        return constant * val
    }
    
}

