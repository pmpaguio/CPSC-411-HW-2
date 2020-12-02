//
//  ClaimService.swift
//  CPSC-411-HW-2
//
//  Created by Paul Paguio on 11/19/20.
//

import UIKit

struct Claim : Codable {
    var title : String
    var date : String
    
    init(title_ : String, date_ : String) {
        title = title_
        date = date_
    }
}

class ClaimService {
    
    var cResp:String
    
    init() {
        cResp = "<Status Message>"
    }
    
   /* init(vc : ViewController) {
        viewController = vc
    }*/
    
    
    /*static private var cService : ClaimService!
    
    static func getInstance(vc : ViewController) -> ClaimService {
        if cService == nil {
            cService = ClaimService(vc: vc)
        }
        return cService
    }*/
    
    func addPerson(cObj : Claim){
        // Implement logic using Async HTTP client API (POST method)
        let requestUrl = "http://localhost:8020/ClaimService/add"
        var request = URLRequest(url: NSURL(string: requestUrl)! as URL)
        let jsonData : Data! = try! JSONEncoder().encode(cObj)
        //
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //
        let task = URLSession.shared.uploadTask(with: request, from: jsonData) {
            (data, response, error) in
            if let resp = data {
                // type of resp is Data
                let respStr = String(bytes: resp, encoding: .utf8)
                self.cResp = "\(respStr!) "
                //
            } else if let respError = error {
                self.cResp = "Server Error : \(respError)"
            }
        }
        task.resume()
    }
}
