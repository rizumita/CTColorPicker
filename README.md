# CTColorPicker
HSB ColorPicker for SwiftUI

![](https://github.com/rizumita/CTColorPicker/blob/screenshot/screenshot.png?raw=true)

## How to use

```swift
ColorPicker(color: self.color) { color in
    self.color = color
}
```

ColorPicker is the view.

Pass an initial color to `color` argument and a closure typed `(UIColor) -> ()` to `onChange` argument.
