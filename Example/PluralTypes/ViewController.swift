//
//  ViewController.swift
//  PluralTypes
//
//  Created by Grzegorz Sagadyn on 11/05/2019.
//

import UIKit
import PluralTypes

internal class ViewController: UIViewController {
    // MARK: - Private Constants
    
    private static let integers: [Int] = [0, 1, 2, 5]
    private static let floats: [Float] = [0.0, 1.5]
    
    // MARK: - Private IBOutlet Properties
    
    @IBOutlet private weak var label: UILabel!
    
    // MARK: - View Controlle Lifecycle
    
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        let locale = Locale(identifier: "pl_PL")
        
        let plurals = [
            Self.integers.map { "Integer \($0): \(Plural(quantity: $0, locale: locale).rawValue)" },
            Self.floats.map { "Float \($0): \(Plural(quantity: $0, locale: locale).rawValue)" }
        ]
        
        label.text = plurals
            .flatMap { $0 }
            .joined(separator: "\n")
    }
}
