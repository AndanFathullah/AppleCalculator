//
//  ContentView.swift
//  Calculator
//
//  Created by Fathullah Auzan Setyo Laksono on 04/01/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentValue: String = "0"
    @State var calculatorMode: CalculatorMode = .noSet
    @State var isMethod: Bool = false
    @State var currentValueInt: Int = 0
    @State var savedValueInt: Int = 0
    var body: some View {
        VStack{
            TotalValue(totalValue: currentValue)
            HStack{
                CalculatorButton(label: "H", color: .blue, action: didPressClear)
                CalculatorButton(label: "C", color: .black, action: didPressClear)
                CalculatorButton(label: "D", color: .red, action: didPressDelete)
                CalculatorButton(label: ":", color: .orange, action: didPressMethod, mode: .distribution)
            }
            HStack{
                CalculatorButton(label: "1", action: didPressNumber)
                CalculatorButton(label: "2", action: didPressNumber)
                CalculatorButton(label: "3", action: didPressNumber)
                CalculatorButton(label: "x", color: .orange, action: didPressMethod, mode: .multiplication)
            }
            HStack{
                CalculatorButton(label: "4", action: didPressNumber)
                CalculatorButton(label: "5", action: didPressNumber)
                CalculatorButton(label: "6", action: didPressNumber)
                CalculatorButton(label: "-", color: .orange, action: didPressMethod, mode: .deduction)
            }
            HStack{
                CalculatorButton(label: "7", action: didPressNumber)
                CalculatorButton(label: "8", action: didPressNumber)
                CalculatorButton(label: "9", action: didPressNumber)
                CalculatorButton(label: "+", color: .orange, action: didPressMethod, mode:.addition)
            }
            HStack{
                CalculatorButton(label: "0", action: didPressNumber,width: .infinity)
                CalculatorButton(label: ",", action: didPressNumber)
                CalculatorButton(label: "=", color: .orange, action: didPressEqual)
                
            }
        }
        .padding(20)
        .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)
        
    }
    
    func didPressNumber(button: CalculatorButton){
        if isMethod == true{
            isMethod = false
            currentValueInt = 0
        }
        if let parsedValue = Int("\(currentValueInt)" + button.label){
            currentValueInt = parsedValue
            updateTextValue()
        }else{
            currentValue = "Err"
        }
    }
    
    func didPressMethod(button: CalculatorButton){
        isMethod = true
        calculatorMode = button.mode
    }
    
    func didPressEqual(button: CalculatorButton){
        switch calculatorMode {
            case .noSet:
                if isMethod{
                    return
                }
            case .addition:
                savedValueInt += currentValueInt
            case .deduction:
                savedValueInt -= currentValueInt
            case .multiplication:
                savedValueInt *= currentValueInt
            case .distribution:
                savedValueInt /= currentValueInt
        }
        
        calculatorMode = .noSet
        currentValueInt = savedValueInt
        updateTextValue()
    }
    
    func didPressClear(button: CalculatorButton){
        currentValue = "0"
        currentValueInt = 0
        calculatorMode = .noSet
    }
    
    func didPressDelete(button: CalculatorButton){
        if currentValue != "0"{
            currentValue.removeLast()
            currentValueInt = Int(currentValue) ?? 0
            if currentValue.count < 1{
                currentValue = "0"
                currentValueInt = 0
            }
            savedValueInt = currentValueInt
        }
    }
    
    func updateTextValue(){
        if calculatorMode == .noSet{
            savedValueInt = currentValueInt
        }
        
        let numberFormater = NumberFormatter()
        numberFormater.numberStyle = .decimal
        
        let format = NSNumber(value: currentValueInt)
        
        currentValue = numberFormater.string(from: format) ?? "0"
    }
}

#Preview {
    ContentView()
}
