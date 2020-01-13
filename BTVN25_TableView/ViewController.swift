//
//  ViewController.swift
//  BTVN25_TableView
//
//  Created by Thiện Tùng on 1/10/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var containerView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    } ()

    var item: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(containerView)
        
        containerView.delegate = self
        containerView.dataSource = self
        
        containerView.register(CustomCell.self, forCellReuseIdentifier: "id")
        
        setupData()
        setupLayout()
        
    }
    
    func setupLayout(){
        //MARK: TableView
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

    }
    
    func setupData() {
        
        let item1: Item = Item(imageName: "background2", nameProduct: "Anh1", desLabel: "Chúc em những năm tháng này có thể cười nhiều hơn, khóc ít đi, hạnh phúc nhân đôi.", priceLabel: "100$")
        let item2: Item = Item(imageName: "background3", nameProduct: "Anh2", desLabel: "Chúc em những năm tháng này có thể quên đi chuyện cũ, quên đi người cũ. Trân trọng hiện tại, yêu lấy bản thân.", priceLabel: "100$")
        let item3: Item = Item(imageName: "background4", nameProduct: "Anh3", desLabel: "Chúc em những năm tháng này đi đúng đường, chọn đúng người, không còn phải nói hai chữ “Giá như ”.", priceLabel: "100$")
        item = [item1, item2, item3]
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = containerView.dequeueReusableCell(withIdentifier: "id", for: indexPath) as! CustomCell
        cell.item = item[indexPath.row]
        
        return cell
    }
    
    
}
