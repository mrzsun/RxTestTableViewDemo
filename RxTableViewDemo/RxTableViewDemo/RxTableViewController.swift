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
    let tableView: UITableView = UITableView(frame: UIScreen.mainScreen().bounds, style: .Plain)
    let reuseIdentifier = "\(TableViewCell.self)"
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, User>>()
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.registerClass(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        dataSource.configureCell = {
            _, tableView, indexPath, user in
            let cell = tableView.dequeueReusableCellWithIdentifier(self.reuseIdentifier, forIndexPath: indexPath) as! TableViewCell
            cell.tag = indexPath.row
            cell.user = user
            return cell
        }
        
        viewModel.getUsers()
            .bindTo(tableView.rx_itemsWithDataSource(dataSource))
            .addDisposableTo(disposeBag)
    }
    
}
