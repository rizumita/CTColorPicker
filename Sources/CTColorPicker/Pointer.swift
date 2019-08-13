//
//  Pointer.swift
//  CTColorPicker
//
//  Created by 和泉田 領一 on 2019/08/04.
//

import SwiftUI

@available(OSX 10.15, iOS 13.0, *)
struct Pointer: View {
    private struct Const {
        static let length: CGFloat = 10.0
        static let cornerRadius = length / 2.0
        static let borderWidth: CGFloat = 2.0
        static let borderColor: Color = .white
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: Const.cornerRadius)
            .strokeBorder(Color.white, lineWidth: Const.borderWidth)
            .frame(width: Const.length, height: Const.length, alignment: .center)
            .foregroundColor(.clear)
    }
}

#if DEBUG
@available(OSX 10.15, iOS 13.0, *)
struct Pointer_Previews: PreviewProvider {
    static var previews: some View {
        Pointer()
    }
}
#endif
