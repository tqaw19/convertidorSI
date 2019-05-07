//
//  ViewController.swift
//  ConvertidorSI
//
//  Created by Alejandro Quesada on 7/05/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var tareas:[Tarea] = []
    
    let list = Unit.allCases()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tareas = crearTareas()
        
        picker.delegate = self
        picker.dataSource = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell {
            let cell = UITableViewCell()
            let tarea = tareas[indexPath.row]
            cell.textLabel?.text = tarea.dato1
            return cell
        }
    
    func crearTareas()-> [Tarea]{
        let tarea1 = Tarea()
        tarea1.dato1 = "1 yard a kilometro"
        
        let tarea2 = Tarea()
        tarea2.dato1 = "1 yard a millas"
        
        let tarea3 = Tarea()
        tarea3.dato1 = "1 milla a yarda"
        
        return [tarea1, tarea2, tarea3]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    @IBAction func convertUnits(_ sender: AnyObject) {
        let fromUnitIdx = picker.selectedRow(inComponent: 0)
        let toUnitIdx = picker.selectedRow(inComponent: 1)
        
        let fromUnit = Unit.fromString(list[fromUnitIdx])!
        let toUnit = Unit.fromString(list[toUnitIdx])!
        
        if let inputText = input.text {
            if !inputText.isEmpty {
                let inputNum = Double(inputText)!
                let outputNum = fromUnit.convertTo(unit: toUnit, value: inputNum)
                output.text = String(outputNum)
            }
        }
    }
    
    
}


