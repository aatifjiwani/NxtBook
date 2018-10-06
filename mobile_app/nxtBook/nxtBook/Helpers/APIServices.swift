//
//  APIServices.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/5/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit

class APIServices {
    static let baseURL = "https://nxtbook.herokuapp.com"
    
    static func loginUser(email: String, password: String, completion: @escaping ([String: Any]?, Int) -> ()) {
        let url = URL(string: "\(baseURL)/login/?token=\(Secrets.appKey)")!
        let json: [String: Any] = [
            "user": [
                "email": email.trimmingCharacters(in: .whitespacesAndNewlines),
                "password": password.trimmingCharacters(in: .whitespacesAndNewlines)
            ]]
        
        makeAPICallWithResponse(url: url, method: "POST", dict: json) { (response, status) in
            completion(response, status)
        }
    }
    
    static func signupUser(username: String, email: String, password: String, confPassword: String, completion: @escaping ([String: Any]) -> ()) {
        let url = URL(string: "\(baseURL)/api/registrations?token=\(Secrets.appKey)")!
        let json: [String: Any] = [
            "user": [
                "username": username.trimmingCharacters(in: .whitespacesAndNewlines),
                "email": email.trimmingCharacters(in: .whitespacesAndNewlines),
                "password": password.trimmingCharacters(in: .whitespacesAndNewlines),
                "password_confirmation": confPassword.trimmingCharacters(in: .whitespacesAndNewlines)
            ]]
        
//        makeAPICallWithResponse(url: url, method: "POST", dict: json) { (response) in
//            completion(response)
//        }
    }
    
    private static func makeAPICallWithResponse(url: URL, method: String, dict: [String: Any]?, completion: @escaping ([String: Any]?, Int) -> ()) {
        
        
        // create post request
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method
        
        // insert json data to the request
        if method == "POST" || method == "DELETE" {
            let jsonData = self.dictToJSONObject(dict: dict!)
            request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
        }
        
        URLSession.shared.dataTask(with: request as URLRequest){ data, response, error in
            if error != nil{
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                }
                print("Getting Error -> \(error!)")
                return
            }
            
            do {
                if let httpResponse = response as? HTTPURLResponse {
                    let status = httpResponse.statusCode
                    if status == 200 {
                        let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any]
                        
                        DispatchQueue.main.async(execute: {
                            completion(result!, status)
                        })
                    } else {
                        DispatchQueue.main.async(execute: {
                            completion(nil, status)
                        })
                    }
                }
                
                
            } catch {
                print("Parsing Error -> \(error)")
            }
        }.resume()
    }
    
    private static func dictToJSONObject(dict: [String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
    }
}
