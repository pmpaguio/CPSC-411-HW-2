//
//  ViewController.swift
//  CPSC-411-HW-2
//
//  Created by Paul Paguio on 11/25/20.
//
//

import UIKit

class ViewController : UIViewController {
    
    var detailScreenGenerator: ClaimDetailScreenGenerator!
    var currentPersonIndx: Int = 0

    var vals = [UITextField]()
    var sViews = [UIStackView]()
    
    @objc func btnClicked(_sender : UIButton) {
        let title : String = detailScreenGenerator.vals[0].text!
        let titleHolder = title
        let date : String = detailScreenGenerator.vals[1].text!
        if (title == "") || (date == "") {
            vals[2].text = "Failed to add claim. Please enter values for claim and/or date"
        }
        else {
            let cObj = Claim(title_: title, date_: date)
            let cService = ClaimService()
            detailScreenGenerator.vals[0].text = ""
            detailScreenGenerator.vals[1].text = ""
            //vals[2].text = cService.addPerson(cObj: cObj)
            cService.addPerson(cObj: cObj)
            // Sleep for 1 second to allow async claim service call to finish
            do {
                sleep(1)
            }
            // Create message if server response string starts with "The"
            // Could be different if not using my server for grading
            let startIndex = cService.cResp.startIndex
            let endIndex = cService.cResp.index(startIndex, offsetBy: 3)
            let range = startIndex..<endIndex
            if cService.cResp[range] != "The" {
                detailScreenGenerator.vals[2].text = "Claim \(titleHolder) failed to be created."
            } else {
                detailScreenGenerator.vals[2].text = "Claim \(titleHolder) was succesfull created."
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        1. Create screen
        detailScreenGenerator = ClaimDetailScreenGenerator(v: view)
        print("Screen generator initialized. ")
        detailScreenGenerator.generate()

    
        
//        2. Prepare data
//        pService = PersonService(vc : self)
//        pService.getAll()
        
//        3. Set the event handling
        let nBtn = detailScreenGenerator.nextBtn
        nBtn?.addTarget(self, action: #selector(btnClicked(_sender:)), for: .touchUpInside)
 

    }
}


