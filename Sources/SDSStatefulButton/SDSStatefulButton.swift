//
//  SDSStatefulButton.swift
//
//  Created by : Tomoaki Yagishita on 2021/06/04
//  © 2021  SmallDeskSoftware
//

import SwiftUI

struct SDSStatefulButton<OnLabel:View, OffLabel:View> : View {
    @State private var bValue: Bool
    var trueLabel: OnLabel
    var falseLabel: OffLabel
    var completion: ((Bool) -> Void)?
    
    init(_ initialValue: Bool,
         @ViewBuilder onLabel: () -> OnLabel,
         @ViewBuilder offLabel: () -> OffLabel,
         completion: ((Bool) -> Void)? = nil) {
        self._bValue = State(wrappedValue: initialValue)
        self.trueLabel = onLabel()
        self.falseLabel = offLabel()
        self.completion = completion
    }
    var body: some View {
        Button(action: {
            self.bValue.toggle()
            completion?(self.bValue)
        }, label: {
            if bValue {
                trueLabel
            } else {
                falseLabel
            }
        })
    }
}
