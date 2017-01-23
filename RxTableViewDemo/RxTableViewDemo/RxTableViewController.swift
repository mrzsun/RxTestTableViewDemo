//
//  RxTableViewController.swift
//  RxTableViewDemo
//
//  Created by Marco Sun on 16/4/28.
//  Copyright © 2016年 com.MarcoSun. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class RxTableViewController: UIViewController {
    let tableView: UITableView = UITableView(frame: UIScreen.main.bounds, style: .plain)
    let reuseIdentifier = "\(TableViewCell.self)"
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, User>>()
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        dataSource.configureCell = {
            _, tableView, indexPath, user in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.reuseIdentifier , for: indexPath) as! TableViewCell
            cell.tag = indexPath.row
            cell.user = user
            return cell
        }
        
        viewModel.getUsers()
            .bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(disposeBag)
    }
    
}
