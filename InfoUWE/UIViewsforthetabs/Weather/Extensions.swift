//
//  Extensions.swift
//  InfoUWE
//
//  Created by Vince Verdadero on 03/03/2022.
//

import Foundation

extension Double {
    // Extension for rounded Double to 0 decimals.
    func roundDouble() -> String {
        return String(format: "%.0f", self)
    }
}

