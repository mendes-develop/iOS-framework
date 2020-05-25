//
//  MainScreen.swift
//  testApp
//
//  Created by Dev on 5/23/20.
//  Copyright © 2020 Dev. All rights reserved.
//

struct Comment : Decodable {
    let postId : Int
    let id: Int
    let name: String
    let email: String
    let body: String
}

import UIKit

class MessagesList: UIView {
    
    var textView = UITextView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .systemPink
        setup()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   func setup(){
    self.addSubview(textView)
    textView.anchor(top: self.safeAreaLayoutGuide.topAnchor, bottom: self.safeAreaLayoutGuide.bottomAnchor, leading: self.safeAreaLayoutGuide.leadingAnchor, trailing: self.safeAreaLayoutGuide.trailingAnchor)
    }
    


}



//
//func fetchData(completion: @escaping (Result< [Comment], Error >) -> ()){
//    let urlString = "https://jsonplaceholder.typicode.com/comments"
//    guard let url = URL(string: urlString) else { return }
//
//    let dataTask = URLSession.shared.dataTask(with: url) { (data, resp, err) in
//
//        if let err = err {
//            completion(.failure(err))
//            return
//        }
//
//        do {
//            let comments = try JSONDecoder().decode([Comment].self, from: data!)
//            completion(.success(comments))
//        } catch let jsonError {
//            completion(.failure(jsonError))
//        }
//
//
//    }
//    dataTask.resume()
//}
//fetchData{ (res) in
//    switch res {
//    case .success(let comments):
//        print(comments)
//    case .failure(let error):
//        print("failed to fetch comments", error)
//    }
//}
