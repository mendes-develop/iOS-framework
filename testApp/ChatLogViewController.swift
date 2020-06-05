//
//  ChatLogViewController.swift
//  testApp
//
//  Created by Dev on 5/27/20.
//  Copyright © 2020 Dev. All rights reserved.
//

import UIKit

class ChatLogViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    var messages: [Message]?
    var chatView: ChatView?
    
    var matchUser: MatchUser? {
        didSet{
            navigationItem.title = matchUser?.name
            messages = matchUser?.message?.allObjects as? [Message]
            messages = messages?.sorted(by: { $0.date?.compare($1.date!) == .orderedAscending })
        }
    }
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        collectionView.backgroundColor = .white
        collectionView.register(ChatLogMessageCell.self, forCellWithReuseIdentifier: cellId)
        let mainView = ChatView(frame: self.view.frame)
        self.chatView = mainView
        self.view.addSubview(chatView!)
        chatView!.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardChange), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardChange), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

    
    @objc func handleKeyboardChange(notification: NSNotification){
        if let userInfo = notification.userInfo {
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            chatView?.bottomConstraint?.constant = isKeyboardShowing ? -keyboardFrame.height : 0
            
            UIView.animate(withDuration: 0, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                self.view.layoutIfNeeded()
                }, completion: { (completed) in
                    
                    if isKeyboardShowing {
                        let indexPath = IndexPath(row: self.messages!.count - 1, section: 0)
                        self.collectionView.scrollToItem(at: indexPath, at: .bottom, animated: true)
                    }
                    
            })
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages?.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chatView?.messageTextField.endEditing(true)
    }
    
    
//    TODO: fix Bubble cells size and center
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ChatLogMessageCell
        cell.messageTextView.text = messages?[indexPath.item].text
        
        if let message = messages?[indexPath.item], let messageText = message.text, let profileImage = message.user?.profileImage {
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimateFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
            
            if message.isSender {
                cell.messageTextView.frame = CGRect(x: self.view.frame.width - estimateFrame.width - 30, y: 0, width: estimateFrame.width + 16, height: estimateFrame.height + 20)
                cell.bubbleView.frame = CGRect(x: self.view.frame.width - estimateFrame.width - 40, y: -4, width: estimateFrame.width + 34, height: estimateFrame.height + 26)
                cell.profileImageView.isHidden = true
                cell.bubbleImage.tintColor = UIColor(red: 0, green: 137/255, blue: 249/255, alpha: 1)
                cell.bubbleImage.image = ChatLogMessageCell.righBubble
                cell.messageTextView.textColor = .white
            } else {
                cell.messageTextView.frame = CGRect(x: 56, y: 0, width: estimateFrame.width + 16, height: estimateFrame.height + 20)
                cell.bubbleView.frame = CGRect(x: 38, y: -4, width: estimateFrame.width + 40, height: estimateFrame.height + 26)
                cell.profileImageView.isHidden = false
                cell.profileImageView.image = UIImage(named: profileImage)
                cell.bubbleImage.image = ChatLogMessageCell.leftBubble
                cell.bubbleImage.tintColor = UIColor(white: 0.95, alpha: 1)
                cell.messageTextView.textColor = .black
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if let messageText = messages?[indexPath.item].text {
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimateFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
            
            return CGSize(width: view.frame.width, height: estimateFrame.height + 20)
        }

        return CGSize(width: view.frame.width, height: 100)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 0)
    }

    
}

//style
extension ChatLogMessageCell {
    
}



