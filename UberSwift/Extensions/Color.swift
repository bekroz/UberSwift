//
//  Color.swift
//  UberSwift
//
//  Created by BekRoz on 28/11/22.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
}
struct ColorTheme {
    let backgroundColor = Color("BackgroundColor")
    let secondaryBackgroundColor = Color("SecondaryBackgroundColor")
    let primaryTextColor = Color("PrimaryTextColor")
}
