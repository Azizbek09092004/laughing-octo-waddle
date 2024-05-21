//
//  SvatCell.swift
//  Uzum Tezkor App
//
//  Created by islombek on 26/01/24.
//

import UIKit

class SavatCell: UITableViewCell {
    let cellView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 4
        return view
    }()
    
    let savatimage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let savatlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    let savatnarx: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .systemRed
        label.textAlignment = .left
        return label
    }()
    
    let plusOneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let plusTwoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 1
        return stepper
    }()
    
    let countLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    let totalSumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .right
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupCellViews()
        setupConstraints()
        
        stepper.addTarget(self, action: #selector(stepperValueChanged), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupCellViews() {
        contentView.addSubview(cellView)
        cellView.addSubview(savatimage)
        cellView.addSubview(savatlabel)
        cellView.addSubview(savatnarx)
        cellView.addSubview(plusOneLabel)
        cellView.addSubview(stepper)
    }
    
    fileprivate func setupConstraints() {
        cellView.translatesAutoresizingMaskIntoConstraints = false
        savatimage.translatesAutoresizingMaskIntoConstraints = false
        savatlabel.translatesAutoresizingMaskIntoConstraints = false
        savatnarx.translatesAutoresizingMaskIntoConstraints = false
        plusOneLabel.translatesAutoresizingMaskIntoConstraints = false
        stepper.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            savatimage.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            savatimage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            savatimage.widthAnchor.constraint(equalToConstant: 70),
            savatimage.heightAnchor.constraint(equalToConstant: 70),
            
            savatlabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 15),
            savatlabel.leadingAnchor.constraint(equalTo: savatimage.trailingAnchor, constant: 10),
            savatlabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            savatnarx.topAnchor.constraint(equalTo: savatlabel.bottomAnchor, constant: 5),
            savatnarx.leadingAnchor.constraint(equalTo: savatimage.trailingAnchor, constant: 10),
            savatnarx.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            
            plusOneLabel.leadingAnchor.constraint(equalTo: savatimage.trailingAnchor, constant: 140),
            plusOneLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -5),
            plusOneLabel.widthAnchor.constraint(equalToConstant: 30),
            plusOneLabel.heightAnchor.constraint(equalToConstant: 30),

            stepper.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -3),
            stepper.centerYAnchor.constraint(equalTo: cellView.centerYAnchor, constant: 25)
        ])
    }
    
    @objc func stepperValueChanged() {
        plusOneLabel.text = "\(Int(stepper.value))"
        calculateTotalSum()
    }
    
    func configureCell(index: Int) {
        cellView.backgroundColor = UIColor(red: 235, green: 235, blue: 235, alpha: 1)
        savatimage.image = UIImage(named: "oqtepamenu")
        savatlabel.text = "Cet Uzum Tezkor Chizburger"
        savatnarx.text = "80 000 sum"
        
        plusOneLabel.text = "0"
        plusTwoLabel.text = "0"
        countLabel.text = "\(Int(stepper.value))"
        calculateTotalSum()
        
        switch index {
        case 0:
            savatimage.image = UIImage(named: "oqtepamenu")
            savatnarx.text = "80 000 sum"
        case 1:
            savatimage.image = UIImage(named: "evosmenu")
            savatnarx.text = "22 000 sum"
        case 2:
            savatimage.image = UIImage(named: "menuitem")
            savatnarx.text = "124 000 sum"
        default:
            savatimage.image = UIImage(named: "beshqozonmenu")
            savatnarx.text = "47 000 sum"
        }
    }
    
    private func calculateTotalSum() {
        let count = Int(stepper.value)
        let priceString = savatnarx.text?.replacingOccurrences(of: " sum", with: "")
        if let price = Int(priceString ?? ""), let totalSum = Optional(price * count) {
            totalSumLabel.text = "\(totalSum) sum"
        } else {
            totalSumLabel.text = "0 sum"
        }
    }
}
