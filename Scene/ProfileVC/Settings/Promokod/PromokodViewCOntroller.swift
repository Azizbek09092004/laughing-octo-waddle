//
//  PromokodViewCOntroller.swift
//  Uzum Tezkor App
//
//  Created by islombek on 09/02/24.
//

import UIKit
import AVKit
import WebKit


class PromocodesViewController: UIViewController {
    
    var gifts: [Gift] = [
        Gift(promocode: "JADJ32453", type: .coupon, name: "Promokod", isSpecial: false)
    ]
        
    private let watchlabel: UILabel = {
        let label = UILabel()
        label.text = "Video ko'rish orqali promkodlarga ega bo'ling"
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 2
        return label
    }()
 
    private let tableView: UITableView = {
           let tableView = UITableView()
           tableView.translatesAutoresizingMaskIntoConstraints = false
           tableView.backgroundColor = .white
           tableView.separatorStyle = .none
           return tableView
       }()
       
    private let watchVideoButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Watch Video", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .appColor.houseIcon
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 4
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Promocodes"
               view.backgroundColor = .white
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GiftCell.self, forCellReuseIdentifier: GiftCell.identifier)
        
        view.addSubview(tableView)
        view.addSubview(watchlabel)
        view.addSubview(watchVideoButton)
       
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: watchVideoButton.topAnchor, constant: -10),
            
            watchlabel.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 150),
            watchlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            watchlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),

            watchVideoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            watchVideoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            watchVideoButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25),
            watchVideoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        watchVideoButton.addTarget(self, action: #selector(watchVideoButtonTapped), for: .touchUpInside)
    }
    
    @objc func watchVideoButtonTapped() {
        simulateVideoWatching()
        presentVideoPlayer()
    }
    
    func simulateVideoWatching() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) { [weak self] in

            let newGifts: [Gift] = [
               
                Gift(promocode: "JADJ32453", type: .coupon, name: "Video orqali ikkitaga ega boldingiz", isSpecial: false),
                Gift(promocode: "NEWCODE1", type: .coupon, name: "New 1", isSpecial: true),
                Gift(promocode: "NEWCODE2", type: .voucher, name: "New 2", isSpecial: true)
            ]
            self?.gifts = newGifts
            self?.tableView.reloadData()
        }
    }
    
    func presentVideoPlayer() {
 
            let videoID = "5kMPys40APw"

            let webView = WKWebView()
            let embedURLString = "https://youtu.be/5kMPys40APw?si=N5PMliuI36Z9bsWs\(videoID)"
            let embedURL = URL(string: embedURLString)
            let request = URLRequest(url: embedURL!)

            webView.load(request)

            let viewController = UIViewController()
            viewController.view.addSubview(webView)
            webView.translatesAutoresizingMaskIntoConstraints = false
            webView.topAnchor.constraint(equalTo: viewController.view.topAnchor).isActive = true
            webView.leadingAnchor.constraint(equalTo: viewController.view.leadingAnchor).isActive = true
            webView.trailingAnchor.constraint(equalTo: viewController.view.trailingAnchor).isActive = true
            webView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor).isActive = true

            present(viewController, animated: true, completion: nil)
        }
}

extension PromocodesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gifts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GiftCell.identifier, for: indexPath) as! GiftCell
        cell.configure(gift: gifts[indexPath.row])
        cell.backgroundColor = .white
        return cell     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedGift = gifts[indexPath.row]
        
        if selectedGift.name == "Buy One Get One Free" {
            UIView.animate(withDuration: 0.2, animations: {
                tableView.deselectRow(at: indexPath, animated: true)
                tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }, completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    tableView.cellForRow(at: indexPath)?.transform = CGAffineTransform.identity
                    tableView.backgroundColor = .white
                }
                self.showPromocodeAlert(promocode: selectedGift.promocode)
            })
        } else {
            showPromocodeAlert(promocode: selectedGift.promocode)
        }
    
    }
    
    func showPromocodeAlert(promocode: String) {
        let alert = UIAlertController(title: "Tabriklaymiz!", message: "Sizda yangi Promokod bor 🥳  : \(promocode)", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}

enum GiftType {
    case coupon
    case voucher
    case giftCard
}

struct Gift {
    let promocode: String
    let type: GiftType
    let name: String
    let isSpecial: Bool
}
