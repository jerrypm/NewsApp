//
//  CustomBottomSheetView.swift
//  NewsApp
//
//  Created by Jeri Purnama Maulid on 07/02/24.
//

import UIKit

protocol CustomBottomSheetDelegate: AnyObject {
    func dismiss()
    func didSelectItem(item: String)
}

class CustomBottomSheetView: UIView {
    private let sheetHeight: CGFloat = 400
    private let animationDuration: TimeInterval = 0.3
    private var isSheetVisible = false

    weak var delegate: CustomBottomSheetDelegate?
    var dataKeys: [String]?
    var dataItems: [String]?

    lazy var sheetContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear

        let viewTop = UIView()
        viewTop.backgroundColor = .white
        view.addSubview(viewTop)

        let viewCenterLine = UIView()
        viewCenterLine.backgroundColor = .lightGray.withAlphaComponent(0.5)
        viewTop.addSubview(viewCenterLine)

        let tableView = UITableView(frame: bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.contentInset = UIEdgeInsets(top: 16, left: 0, bottom: 44, right: 0)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.addSubview(tableView)

        // Set up constraints for viewTop
        viewTop.translatesAutoresizingMaskIntoConstraints = false
        viewTop.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewTop.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewTop.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewTop.heightAnchor.constraint(equalToConstant: 44).isActive = true

        let cornerRadius: CGFloat = 10.0
        viewTop.layer.cornerRadius = cornerRadius
        viewTop.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        // Set up constraints for viewCenterLine within viewTop
        viewCenterLine.translatesAutoresizingMaskIntoConstraints = false
        viewCenterLine.centerXAnchor.constraint(equalTo: viewTop.centerXAnchor).isActive = true
        viewCenterLine.centerYAnchor.constraint(equalTo: viewTop.centerYAnchor).isActive = true
        viewCenterLine.widthAnchor.constraint(equalTo: viewTop.widthAnchor, multiplier: 1 / 4).isActive = true
        viewCenterLine.heightAnchor.constraint(equalToConstant: 4).isActive = true

        // Set up constraints for Table View
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: viewTop.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSheetView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSheetView()
    }

    func setupSheetView() {
        addSubview(sheetContentView)
        sheetContentView.translatesAutoresizingMaskIntoConstraints = false
        sheetContentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sheetContentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        sheetContentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: sheetHeight).isActive = true
        sheetContentView.heightAnchor.constraint(equalToConstant: sheetHeight).isActive = true

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideBottomSheet))
        tapGestureRecognizer.cancelsTouchesInView = false
        addGestureRecognizer(tapGestureRecognizer)
    }

    func showBottomSheet() {
        UIView.animate(withDuration: animationDuration) {
            self.sheetContentView.transform = CGAffineTransform(translationX: 0, y: -self.sheetHeight)
        }
        isSheetVisible = true
    }

    @objc
    func hideBottomSheet(_ sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: sheetContentView)
        if !sheetContentView.bounds.contains(tapLocation) {
            hideAction()
        }
    }

    private func hideAction() {
        delegate?.dismiss()

        UIView.animate(withDuration: animationDuration) {
            self.sheetContentView.transform = .identity
        }
        isSheetVisible = false
    }
}

extension CustomBottomSheetView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataKeys?.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(dataKeys?[indexPath.row] ?? .empty) - \(dataItems?[indexPath.row] ?? .empty)"
        return cell
    }
}

extension CustomBottomSheetView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            if let value = self.dataKeys?[indexPath.row] {
                self.delegate?.didSelectItem(item: value)
            }
            self.hideAction()
        }
    }
}
