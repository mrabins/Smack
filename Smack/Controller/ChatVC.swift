//
//  ChatVC.swift
//  Smack
//
//  Created by Mark Rabins on 9/3/17.
//  Copyright © 2017 self. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var channelNameLabel: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var sendMessageButton: UIButton!
    
    // MARK: Variables
    var isTyping = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bindToKeyboard()
        
        chatTableView.delegate = self
        chatTableView.dataSource = self
        sendMessageButton.isHidden = true
        
        chatTableView.estimatedRowHeight = 80
        chatTableView.rowHeight = UITableViewAutomaticDimension
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(ChatVC.handleTap))
        view.addGestureRecognizer(tap)
        
        menuButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANELS_SELECTED, object: nil)
        
        SocketService.instance.getChatMessage { (success) in
            if success {
                self.chatTableView.reloadData()
                if MessageService.instance.messages.count > 0 {
                    let endIndex = IndexPath(row: MessageService.instance.messages.count - 1, section: 0)
                    self.chatTableView.scrollToRow(at: endIndex, at: .bottom, animated: false)
                }
            }
        }
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLoggedIn {
            onLoginGetMessages()
        } else {
            channelNameLabel.text = "Please Log In"
            chatTableView.reloadData()
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannel()
    }
    
    func updateWithChannel() {
        let channelName = MessageService.instance.selectedChannel?.name ?? ""
        channelNameLabel.text = "#\(channelName)"
        getMessages()
    }
    
    func onLoginGetMessages() {
        MessageService.instance.findAllChannel { (success) in
            if success {
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannel = MessageService.instance.channels[0]
                    self.updateWithChannel()
                } else {
                    self.channelNameLabel.text = "There Are No Channels Yet"
                }
            }
        }
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @IBAction func sendMessagePressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            guard let channelId = MessageService.instance.selectedChannel?._id else { return }
            guard let message = messageTextField.text else { return }
            
            SocketService.instance.addMessage(messageBody: message, userId: UserDataService.instance.id, channelId: channelId, completion: { (success) in
                if success {
                    self.messageTextField.text = ""
                    self.messageTextField.resignFirstResponder()
                }
            })
        }
    }
    
    func getMessages() {
        guard let channelId = MessageService.instance.selectedChannel?._id else { return }
        MessageService.instance.findAllMessageForChannel(channelId: channelId) { (success) in
            if success {
                self.chatTableView.reloadData()
            }
        }
    }
    
    @IBAction func messageBoxEditing(_ sender: Any) {
        
        if messageTextField.text == "" {
            isTyping = false
            sendMessageButton.isHidden = false
        } else {
            if isTyping == false {
                sendMessageButton.isHidden = false
            }
            isTyping = true
        }
    }
}

extension ChatVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = chatTableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as? MessageCell {
            let message = MessageService.instance.messages[indexPath.row]
            cell.configureCell(message: message)
            return cell
            
        } else {
            return UITableViewCell()
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.messages.count
    }
}
