//
//  APIRequest.swift
//  testApp
//
//  Created by Dev on 5/24/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
    
}

struct APIRequest {
    var resourceURL: URL
    
    init(endpoint: String){
        let urlString = "http://localhost:3000/\(endpoint)"
        guard let resourceURL = URL(string: urlString) else { fatalError() } // should allow fatal error?
        self.resourceURL = resourceURL
    }
    
    func registerUser(credentials: LoginData, completion: @escaping(Result<LoginResponse, APIError>) -> Void){
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest.httpBody = try JSONEncoder().encode(credentials)
            
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, err in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                
                do {
                    let loggedUser = try JSONDecoder().decode(LoginResponse.self, from: jsonData)
                    completion(.success(loggedUser))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }
}


final class LoginData: Encodable {
    let email: String
    let password: String
    var passwordConfirmation: String?
    
    init(email: String, password: String, passwordConfirmation: String?) {
        self.email = email
        self.password = password
        self.passwordConfirmation = passwordConfirmation
    }
}

struct LoginResponse: Decodable {
    let userId: String
    let token: String
}


//struct LoginData {
//    let email: String
//    let password: String
//}
//
//struct SignupData {
//    let email: password
//}
