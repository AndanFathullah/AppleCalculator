//
//  CalculatorFillButton.swift
//  Calculator
//
//  Created by Fathullah Auzan Setyo Laksono on 04/01/24.
//

import SwiftUI

struct CalculatorFillButton: View {
    var label: String = "0"
    var color: Color = .gray
    var action: (CalculatorFillButton) -> Void = {_ in }
    var mode: CalculatorMode = .noSet
    var body: some View {
        Button(action: {
            action(self)
        }, label: {
            Text(label)
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.medium)
                .frame(maxWidth: .infinity, maxHeight: 80)
                .scaledToFill()
                .background(color)
                .cornerRadius(40)
        })
        
    }
}

#Preview {
    CalculatorFillButton()
}
