//
//  MainViewController.swift
//  testApp
//
//  Created by Dev on 5/23/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

//class MatchUser: NSObject {
//    var name: String?
//    var profileImage: String?
//}
//
//class Message: NSObject {
//    var user: MatchUser?
//    var date: NSDate?
//    var text: String?
//}

class MessageViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    var messagesPreview: [Message]?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Recents"
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.register(MessageCell.self, forCellWithReuseIdentifier: cellId)
        setUpData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messagesPreview?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MessageCell
        if let message = messagesPreview?[indexPath.item]{
            cell.message = message
        }
//        cell.profileImage.image = UIImage(named: "alex_profile")
//        cell.nameLabel.text = "Alex Mendes"
//        cell.timeLabel.text = "5:50 PM"
//        cell.messageLabel.text = "A lof of text to show the amount of text show the amount of text"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
        

}

extension MessageViewController {
    func setUpData(){
        let user1 = MatchUser()
        user1.name = "Alex Mendes"
        user1.profileImage = "alex_profile"
        
        let message1 = Message()
        
//        message1.text = "What's my man. How are you doing today? Isn't a beutiful day today?"
//        message1.date = NSDate() as Date
        
        let user2 = MatchUser()
        user2.name = "Alex Mendes"
        user2.profileImage = "alex_profile"
        
        let message2 = Message()

        message2.text = "What's my man. How are you doing today? Isn't a beutiful day today?"
        message2.date = NSDate() as Date
        
        messagesPreview = [message1, message2]
    }
}