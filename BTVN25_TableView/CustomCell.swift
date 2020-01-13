//
//  CustomCell.swift
//  BTVN25_TableView
//
//  Created by Thiện Tùng on 1/10/20.
//  Copyright © 2020 tung. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .lightGray
        
        return view
    } ()
    let imageProduct: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .brown
        view.clipsToBounds = true
        
        return view
    } ()
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        
        return label
    } ()
    let desLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.textColor = .darkGray
        label.numberOfLines = 0
        
        return label
    } ()
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .red
        
        return label
    } ()
    let numberOfPacksLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .red
        label.backgroundColor = .lightGray
        label.text = "0"
        label.textAlignment = .center
        
        return label
    } ()
    
    let subButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("-", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .lightGray
        button.backgroundColor = .darkGray
        
        return button
    } ()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(.green, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .darkGray
        
        return button
    } ()
    
    let notUse: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
        
    }()
    
    var n: Int = 0
    var item: Item? {
        didSet {
            if let data = item {
                imageProduct.image = UIImage(named: data.imageName)
                nameLabel.text = data.nameProduct
                desLabel.text = data.desLabel
                priceLabel.text = data.priceLabel
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        addView()
        
        
    }
    func addView(){
        self.addSubview(containerView)
        containerView.addSubview(imageProduct)
        containerView.addSubview(nameLabel)
        containerView.addSubview(desLabel)
        containerView.addSubview(priceLabel)
        containerView.addSubview(numberOfPacksLabel)
        containerView.addSubview(subButton)
        containerView.addSubview(addButton)
        containerView.addSubview(notUse)
        setupLayout()
        setupButton()
    }
    
    func setupLayout() {
        //ContainerView
        containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        containerView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        containerView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        //image
        imageProduct.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 6).isActive = true
        imageProduct.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 6).isActive = true
        imageProduct.widthAnchor.constraint(equalToConstant: 130).isActive = true
        imageProduct.heightAnchor.constraint(equalToConstant: 170).isActive = true
        //
        nameLabel.topAnchor.constraint(equalTo: imageProduct.topAnchor, constant: 0).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: imageProduct.rightAnchor, constant: 24).isActive = true
        //
        desLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 13).isActive = true
        desLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        desLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -16).isActive = true
        //
        priceLabel.topAnchor.constraint(equalTo: desLabel.bottomAnchor, constant: 24).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        //
        subButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 14).isActive = true
        subButton.leftAnchor.constraint(equalTo: nameLabel.leftAnchor, constant: 0).isActive = true
        subButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        subButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        //
        numberOfPacksLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 14).isActive = true
        numberOfPacksLabel.leftAnchor.constraint(equalTo: subButton.rightAnchor, constant: 0).isActive = true
        numberOfPacksLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        numberOfPacksLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        //
        addButton.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 14).isActive = true
        addButton.leftAnchor.constraint(equalTo: numberOfPacksLabel.rightAnchor, constant: 0).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        //
        notUse.topAnchor.constraint(equalTo: subButton.bottomAnchor, constant: 0).isActive = true
        notUse.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        notUse.widthAnchor.constraint(equalToConstant: 100).isActive = true
        notUse.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
    func setupButton(){
        subButton.addTarget(self, action: #selector(downNumber), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(upNumber), for: .touchUpInside)
        
    }

    @objc func downNumber(){
        if n > 0 {
            n -= 1
            numberOfPacksLabel.text = String(n)
        }
        
    }
    @objc func upNumber(){
        n += 1
        numberOfPacksLabel.text = String(n)
    }
}
