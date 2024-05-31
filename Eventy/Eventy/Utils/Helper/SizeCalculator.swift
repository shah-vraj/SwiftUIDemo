//
//  SizeCalculator.swift
//  Eventy
//
//  Created by Vraj Shah on 21/06/23.
//

import SwiftUI

struct SizeCalculator: ViewModifier {
    
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { reader in
                    Color.clear
                        .onAppear { size = reader.size }
                }
            )
    }
}
