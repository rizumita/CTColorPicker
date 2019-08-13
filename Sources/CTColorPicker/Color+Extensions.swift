//
//  Color+Extensions.swift
//  CTColorPicker
//
//  Created by 和泉田 領一 on 2019/08/04.
//

import Foundation
import SwiftUI

@available(OSX 10.15, iOS 13.0, *)
extension Color {
    init(hex: String) {
        let v = Int("000000" + hex, radix: 16) ?? 0
        let r = Double(v / Int(powf(256, 2)) % 256) / 255
        let g = Double(v / Int(powf(256, 1)) % 256) / 255
        let b = Double(v / Int(powf(256, 0)) % 256) / 255
        self.init(red: r, green: g, blue: b)
    }
}
