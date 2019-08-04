//
//  ColorPicker.swift
//  CTColorPicker
//
//  Created by 和泉田 領一 on 2019/08/03.
//

import SwiftUI
import Combine

public struct ColorPicker: View {
    private let triangleScale: CGFloat
    private let model: ColorPickerModel
    private var cancellables = Set<AnyCancellable>()
    
    public init(color: UIColor = .white, triangleScale: CGFloat = 0.8, onChange: @escaping (UIColor) -> ()) {
        self.triangleScale = triangleScale
        self.model = ColorPickerModel(color: color)
        self.model.objectWillChange.sink(receiveValue: onChange).store(in: &cancellables)
    }
    
    public var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack(alignment: .center) {
                    HCircle(scale: self.triangleScale)
                    SBSquare(scale: self.triangleScale)
                }
                .frame(width: getLength(geometry),
                       height: getLength(geometry),
                       alignment: .center)
            }
        }.environmentObject(model)
    }
}

#if DEBUG
struct ColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker { _ in }
    }
}
#endif
