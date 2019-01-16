//
//  APIServices.swift
//  nxtBook
//
//  Created by Aatif Jiwani on 10/5/18.
//  Copyright © 2018 Aatif Jiwani. All rights reserved.
//

import UIKit
import Firebase

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
    
    static func signupUser(lastname: String, email: String, password: String, firstname: String, completion: @escaping ([String: Any]?, Int) -> ()) {
        let url = URL(string: "\(baseURL)/signup/?token=\(Secrets.appKey)")!
        let json: [String: Any] = [
            "user": [
                "firstname": firstname.trimmingCharacters(in: .whitespacesAndNewlines),
                "email": email.trimmingCharacters(in: .whitespacesAndNewlines),
                "password": password.trimmingCharacters(in: .whitespacesAndNewlines),
                "lastname": lastname.trimmingCharacters(in: .whitespacesAndNewlines),
            ]]
        
        makeAPICallWithResponse(url: url, method: "POST", dict: json) { (response, status) in
            completion(response, status)
        }
    }
    
    static func getUser(id: Int, completion: @escaping ([String: Any]?, Int) -> ()) {
        let url = URL(string: "\(baseURL)/users/\(id)?token=\(Secrets.appKey)")!
        
        makeAPICallWithResponse(url: url, method: "GET", dict: nil) { (response, status) in
            completion(response,status)
        }
        
    }
    
    static func createSoldBook(title: String, author: String, edition: String, isbn: String, price: Double, condition: Int, coverPhoto: String, userId: Int, completion: @escaping ([String: Any]?, Int) -> ()) {
        let url = URL(string: "\(baseURL)/selling_books/?token=\(Secrets.appKey)")!
        let json: [String: Any] = [
            "user_id": userId,
            "selling_book": [
                "title": title.trimmingCharacters(in: .whitespacesAndNewlines),
                "author": author.trimmingCharacters(in: .whitespacesAndNewlines),
                "isbn": isbn.trimmingCharacters(in: .whitespacesAndNewlines),
                "price": price,
                "condition": condition,
                "coverphoto": coverPhoto.trimmingCharacters(in: .whitespacesAndNewlines),
                "edition": edition.trimmingCharacters(in: .whitespacesAndNewlines)
            ],
        ]
        
        makeAPICallWithResponse(url: url, method: "POST", dict: json) { (response, status) in
            completion(response, status)
        }
    }
    
    static func getImageFromURL(url: URL, completion: @escaping (Data) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil{
                print("Getting Error -> \(error!)")
                return
            }
            
            DispatchQueue.main.async {
                if let unwrappedData = data {
                    completion(unwrappedData)
                }
            }
            }.resume()
    }
    
    static func changeUserProfilePicture(id: Int, profileURL: String, completion: @escaping ([String:Any]?, Int) -> ()) {
        let url = URL(string: "\(baseURL)/users/\(id)?token=\(Secrets.appKey)")!
        let json: [String: Any] = [
            "user": [
                "profilepicture": profileURL.trimmingCharacters(in: .whitespacesAndNewlines)
            ]]
        
        makeAPICallWithResponse(url: url, method: "PUT", dict: json) { (response, status) in
            completion(response, status)
        }
    }
    
    static func handleUploadImageToFirebase(image: UIImage, username: String, completion: @escaping (String) -> ()) {
        let imageName = NSUUID().uuidString
        let storage = Storage.storage().reference().child("\(username)\(imageName).jpg")
        if let data = UIImageJPEGRepresentation(image, 0.2) {
            storage.putData(data, metadata: nil) { (metadata, error) in
                if error != nil {
                    print(error!)
                }
                
                storage.downloadURL(completion: { (url, error) in
                    if let downURL = url?.absoluteString {
                        print(downURL)
                        completion(downURL)
                    } else {
                        //completion("")
                    }
                })
            }
        }
    }
    
    static func getUserBooks(id: Int, completion: @escaping ([String: Any]?, Int) -> ()) {
        let url = URL(string: "\(baseURL)/users/\(id)?filter=books&token=\(Secrets.appKey)")!
        
        makeAPICallWithResponse(url: url, method: "GET", dict: nil) { (response, status) in
            completion(response,status)
        }
        
    }
    
    private static func makeAPICallWithResponse(url: URL, method: String, dict: [String: Any]?, completion: @escaping ([String: Any]?, Int) -> ()) {
        
        
        // create post request
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = method
        
        // insert json data to the request
        if method == "POST" || method == "DELETE" || method == "PUT" {
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
