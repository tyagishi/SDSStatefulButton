//
//  SDSStatefulButton.swift
//
//  Created by : Tomoaki Yagishita on 2021/06/04
//  © 2021  SmallDeskSoftware
//

import SwiftUI

public struct SDSStatefulButton<TrueLabel:View, FalseLabel:View> : View {
    @State private var bValue: Bool
    var trueLabel: TrueLabel
    var falseLabel: FalseLabel
    var onChange: ((Bool) -> Void)?
    
    public init(_ initialValue: Bool,
         @ViewBuilder trueLabel: () -> TrueLabel,
         @ViewBuilder falseLabel: () -> FalseLabel,
         onChange: ((Bool) -> Void)? = nil) {
        self._bValue = State(wrappedValue: initialValue)
        self.trueLabel = trueLabel()
        self.falseLabel = falseLabel()
        self.onChange = onChange
    }
    
    public var body: some View {
        Button(action: {
            self.bValue.toggle()
            onChange?(self.bValue)
        }, label: {
            if bValue {
                trueLabel
            } else {
                falseLabel
            }
        })
    }
}
