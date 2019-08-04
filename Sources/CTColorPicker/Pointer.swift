//
//  Pointer.swift
//  CTColorPicker
//
//  Created by 和泉田 領一 on 2019/08/04.
//

import SwiftUI

struct Pointer: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 5.0)
            .strokeBorder(Color.white, lineWidth: 2.0)
            .frame(width: 10.0, height: 10.0, alignment: .center)
            .foregroundColor(.clear)
    }
}

#if DEBUG
struct Pointer_Previews: PreviewProvider {
    static var previews: some View {
        Pointer()
    }
}
#endif
