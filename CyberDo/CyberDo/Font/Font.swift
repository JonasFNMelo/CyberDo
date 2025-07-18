//
//  Font.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 14/07/25.
//
import SwiftUI

/// Extenção para adcionar a sfMono como font dentro do projeto
extension Font {
    static func sfMono(fontStyle: Font.TextStyle = .body, fontWeight: Weight = .regular) -> Font {
        
        print("\(SFMonoFont(weight: fontWeight).rawValue), size: \(fontStyle.size)")
        return Font.custom(SFMonoFont(weight: fontWeight).rawValue, size: fontStyle.size)
    }
}

/// Extenção para modificar o textStyle da sfMono
extension Font.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle: return 34
        case .title: return 30
        case .title2: return 22
        case .title3: return 20
        case .headline: return 18
        case .body: return 16
        case .callout: return 15
        case .subheadline: return 14
        case .footnote: return 13
        case .caption: return 12
        case .caption2: return 11
        @unknown default: return 8
        }
    }
}

/// Enum para definir qual tipo da sfMono utilizar
enum SFMonoFont: String {
    case regular = "SFMono-Regular"
    case medium = "SFMono-Medium"
    case semibold = "SFMono-Semibold"
    case bold = "SFMono-Bold"

    init(weight: Font.Weight) {
        switch weight {
        case .regular:
            self = .regular
        case .medium:
            self = .medium
        case .semibold:
            self = .semibold
        case .bold:
            self = .bold
        default:
            self = .regular
        }
    }
}
