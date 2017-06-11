//
//  ASAlbumLIstViewController.swift
//  Pods
//
//  Created by zkhCreator on 04/06/2017.
//
//

import UIKit
import Photos
import SVProgressHUD

public class ASAlbumListViewController: UITableViewController {
    
    var albumArray:Array<ASCollectionModel> = []
    
    
    // MARK: - life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.title = "相册列表".localization(bundle: Bundle.getBundle())
        
        self.tableView.register(UINib.init(nibName: "ASAlbumListTableViewCell", bundle: Bundle.getBundle()), forCellReuseIdentifier: NSStringFromClass(ASAlbumListTableViewCell.self))
        self.tableView.estimatedRowHeight = 70
        self.tableView.separatorStyle = .none
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        SVProgressHUD.show()
        DispatchQueue.global().async {
            ASAlbumUtilsManager.checkAlbumAuth {
                self.albumArray = ASAlbumUtilsManager.loadAllASCollectionModels()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    SVProgressHUD.dismiss()
                }
            }
        }
    }
    
    // MARK: - private Method
    func formatCellInfo(cell: ASAlbumListTableViewCell, info:ASCollectionModel) {
        cell.albumTitleLabel.text = info.name
        cell.albumCountLabel.text = String.init(format: "%d", info.count)
        if info.thumbnail != nil {
            cell.thumbnail.image = info.thumbnail
        }
    }
    
    // MARK: - delegate && dataSource
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(ASAlbumListTableViewCell.self))!
        if cell is ASAlbumListTableViewCell {
            self.formatCellInfo(cell: cell as! ASAlbumListTableViewCell, info: self.albumArray[indexPath.row])
        }
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albumArray.count
    }
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
