//
//  MainViewController.swift
//  testApp
//
//  Created by Dev on 5/23/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit
import CoreData

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

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let layout = UICollectionViewFlowLayout()
        let chatController = ChatLogViewController(collectionViewLayout: layout)
        chatController.matchUser = messagesPreview?[indexPath.item].user
        navigationController?.pushViewController(chatController, animated: true)
    }
    
        

}








extension MessageViewController {
    func setUpData(){
        
        if let users = CoreDataManager.shared.fetchMatchUsers(){
            for user in users {
                CoreDataManager.shared.deleteMatchUser(user: user)
            }
        }
        
        generateFakeMessages()
        loadData()

    }
    func loadData(){
        guard let latestMessages = CoreDataManager.shared.fetchLatestMessages() else { return }
        messagesPreview = latestMessages
    }
    
    func generateFakeMessages(){
        guard let user3 = CoreDataManager.shared.createMatchUser(name: "Sukrit Walia", profileImage: "sukrit") else { return }
        guard CoreDataManager.shared.createMessage(text: "Michelle is planning on being at AA for 41 years?", date: Date().addingTimeInterval(-2 * 60), user: user3) != nil else { return }
        guard CoreDataManager.shared.createMessage(text: "What's my man. How are you doing today? Isn't a beutiful day today?", date: Date().addingTimeInterval(-3 * 60), user: user3) != nil else { return }
        
        guard let user2 = CoreDataManager.shared.createMatchUser(name: "Michelle Nguyen", profileImage: "michelle") else { return }
        guard CoreDataManager.shared.createMessage(text: "Can I wer light jeans during winter time?", date: Date().addingTimeInterval(-4 * 60), user: user2) != nil else { return }
        guard CoreDataManager.shared.createMessage(text: "What's my man. How are you doing today? Isn't a beutiful day today?", date: Date().addingTimeInterval(-5 * 60), user: user2) != nil else { return }
        
        guard let user1 = CoreDataManager.shared.createMatchUser(name: "Alex Mendes", profileImage: "alex") else { return }
        guard CoreDataManager.shared.createMessage(text: "Nothing interesting to say", date: Date().addingTimeInterval(-6 * 60), user: user1) != nil
            else { return }
        guard CoreDataManager.shared.createMessage(text: "What's my man. How are you doing today? Isn't a beutiful day today?", date: Date().addingTimeInterval(-7 * 60), user: user1) != nil
        else { return }
    }
}
