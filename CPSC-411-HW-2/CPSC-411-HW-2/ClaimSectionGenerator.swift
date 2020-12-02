//
//  ClaimSectionGenerator.swift
//  CSPC-411-HW-2
//
//  Created by Paul Paguio on 11/19/20.
//


import UIKit

class ClaimDetailSectionGenerator {
    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        
        let title = UILabel()
        title.text = "Please Enter Claim Information"
        title.font = UIFont(name: "Georgia-BoldItalic", size: 20)
        title.textAlignment = .center
        title.textColor = UIColor.blue
        title.sizeToFit()
        let titleView = UIStackView()
        titleView.addArrangedSubview(title)
        titleView.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        titleView.isLayoutMarginsRelativeArrangement = true
        stackView.addArrangedSubview(titleView)
        
        var vGenerator: FieldValueViewGenerator!
        var sView: UIStackView!
        vGenerator = FieldValueViewGenerator(n: "Claim Title")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        vGenerator = FieldValueViewGenerator(n: "Date")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        vGenerator = FieldValueViewGenerator(n: "Status")
        sView = vGenerator.generate()
        sView.layoutMargins = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        sView.isLayoutMarginsRelativeArrangement = true
        stackView.addArrangedSubview(sView)
        
        return stackView
    }
}

class buttonSectionGenerator {
    
    func generate() -> UIStackView {
        
        let bStackView = UIStackView()
        bStackView.axis = .horizontal
        bStackView.distribution = .fill
        bStackView.spacing = 5
        
        let btn = UIButton()
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitleColor(UIColor.black, for: .highlighted)
        btn.backgroundColor = UIColor.blue
        bStackView.addArrangedSubview(btn)
        
        return bStackView
    }
}

class ClaimDetailScreenGenerator {
    
    var root: UIView!
    var detailSecView: UIStackView!
    var buttonSecView: UIStackView!
    var vals: [UITextField]!
    var lbls: [UILabel]!
    var nextBtn: UIButton!
    
    init(v: UIView) {
        root = v
    }

    func setViewReference() {
        vals = [UITextField]()
        lbls = [UILabel]()
        
        for sv in detailSecView.arrangedSubviews {
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews {
                if ve is UITextField {
                    vals.append(ve as! UITextField)
                } else {
                    lbls.append(ve as! UILabel)
                }
            }
        }
        print("UITextField references created.")
        
//        Make UITextField read-only
        for v in vals {
            v.isUserInteractionEnabled = true
        }
        
        for sv in buttonSecView.arrangedSubviews {
            let btn = sv as! UIButton
            if btn.titleLabel?.text == "Add" {
                nextBtn = btn
            }
        }
    }
    
    func setDetailSecConstraints() {
        for i in 1...lbls.count-1 {
            lbls[i].setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            lbls[i].setContentHuggingPriority(.defaultHigh, for: .horizontal)
        }
        let constr = lbls[1].widthAnchor.constraint(equalToConstant: root.frame.width * 0.25)
        constr.isActive = true
        
        for i in 1...lbls.count-1 {
            lbls[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = lbls[i].trailingAnchor.constraint(equalTo: lbls[1].trailingAnchor)
            constr.isActive = true
        }
        
        for i in 0...vals.count-1 {
//            vals[i].setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
            vals[i].setContentHuggingPriority(.defaultLow, for: .horizontal)
        }
        detailSecView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = detailSecView.topAnchor.constraint(equalTo: root.safeAreaLayoutGuide.topAnchor)
        let lCont = detailSecView.leadingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.leadingAnchor)
        let trCont = detailSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
    }
    
    func setButtonSecConstraints() {
        buttonSecView.translatesAutoresizingMaskIntoConstraints = false
        let tpConst = buttonSecView.topAnchor.constraint(equalTo: vals[1].safeAreaLayoutGuide.bottomAnchor)
        let trConst = buttonSecView.trailingAnchor.constraint(equalTo: root.safeAreaLayoutGuide.trailingAnchor)
       tpConst.isActive = true
        trConst.isActive = true
    }
    
    func generate() {
        
        
        
        detailSecView = ClaimDetailSectionGenerator().generate()
        print("Detail section was created.")
        
        buttonSecView = buttonSectionGenerator().generate()
        print("Button section was created.")
        
        root.addSubview(detailSecView)
        root.addSubview(buttonSecView)
        

        setViewReference()
        print("setViewReference() called.")
        
//        Set constraints for detailSecView
        setDetailSecConstraints()
        print("setDetailSecConstraints() called.")
        
//        Set constraints for buttonSecView
        setButtonSecConstraints()
        print("setButtonSecConstraints() called.")
    }
}
