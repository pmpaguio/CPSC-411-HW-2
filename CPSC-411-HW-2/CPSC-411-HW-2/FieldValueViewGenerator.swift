//
//  FieldValueViewGenerator.swift
//  CPSC-411-HW-2
//
//  Created by Paul Paguio on 11/19/20.
//


import UIKit

class FieldValueViewGenerator {
    var lblName: String!
    
    init(n: String) {
        lblName = n
    }
    
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 5
        
        let lbl = UILabel()
        lbl.text = lblName
        lbl.sizeToFit()
        let val = UITextField()
        val.borderStyle = UITextField.BorderStyle.roundedRect
        
        if lblName == "Status" {
            val.isUserInteractionEnabled = false
            val.text = "<Status Message>"
            val.backgroundColor = UIColor.lightGray
            val.font = UIFont(name: "Georgia-Italic", size: 12)
        }
        
        stackView.addArrangedSubview(lbl)
        stackView.addArrangedSubview(val)
        
//        lbl.setContentHuggingPriority(.defaultHigh, for: .horizontal)
//        val.setContentHuggingPriority(.defaultLow, for: .horizontal)
//        lbl.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
//        val.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        
        return stackView
    }
}
