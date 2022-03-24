//
//  Plural+Initialization.swift
//  PluralTypes
//
//  Created by Grzegorz Sagadyn on 05.11.2019.
//

import Foundation
import CoreGraphics

extension Plural {
    public init(quantity: Int, locale: Locale = .current) {
        self = Self.pluralType(for: "integer_variable", locale: locale, quantity: quantity)
    }
    
    public init(quantity: Double, locale: Locale = .current) {
        self = Self.pluralType(for: "float_variable", locale: locale, quantity: quantity)
    }
    
    public init(quantity: Float, locale: Locale = .current) {
        self = Self.pluralType(for: "float_variable", locale: locale, quantity: quantity)
    }
    
    public init(quantity: CGFloat, locale: Locale = .current) {
        self.init(quantity: Double(quantity), locale: locale)
    }
    
    public init(quantity: Decimal, locale: Locale = .current) {
        self.init(quantity: (quantity as NSDecimalNumber).doubleValue, locale: locale)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

extension Plural {
    #if SWIFT_PACKAGE
    private static let bundle = Bundle.module
    #else
    private static let bundle = Bundle(for: BundleToken.self)
    #endif

    private static let tableName = "Plural"
    
    private static func pluralType<T>(for key: String, locale: Locale, quantity: T) -> Plural {
        let name = pluralName(for: key, locale: locale, quantity: quantity)
        return Plural(rawValue: name ?? Plural.other.rawValue) ?? .other
    }
    
    private static func pluralName<T>(for key: String, locale: Locale, quantity: T) -> String? {
        let format = NSLocalizedString(key, tableName: tableName, bundle: bundle, value: "", comment: "")
        return (quantity as? CVarArg).map { String(format: format, locale: locale, arguments: [$0]) }
    }
}

// -----------------------------------------------------------------------------
// MARK: - Bundle Token
// -----------------------------------------------------------------------------

fileprivate class BundleToken { }
