//
//  SliderUIKit.swift
//  Homework4.4
//
//  Created by Дмитрий Дуров on 19.09.2022.
//

import SwiftUI

struct SliderUIKIT: UIViewRepresentable {
    
    @Binding var value: Double
    let opacity: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()

        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderReleased),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = UIColor(displayP3Red: 1, green: 0, blue: 0, alpha: opacity / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderUIKIT {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func sliderReleased(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderUIKit_Previews: PreviewProvider {
    static var previews: some View {
        SliderUIKIT(value: .constant(50.0), opacity: 0.2)
    }
}
