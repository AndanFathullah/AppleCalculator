//
//  TotalValue.swift
//  Calculator
//
//  Created by Fathullah Auzan Setyo Laksono on 04/01/24.
//

import SwiftUI

struct TotalValue: View {
    var totalValue: String = "0"
    var body: some View {
        VStack{
            Text(totalValue)
                .fontWeight(.medium)
                .font(.system(size: 70))
                .minimumScaleFactor(0.5)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

#Preview {
    TotalValue()
}
