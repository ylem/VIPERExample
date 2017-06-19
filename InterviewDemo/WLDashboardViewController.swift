//
//  WLDashboardViewController.swift
//  InterviewDemo
//
//  Created by Wei Lu on 18/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit

class WLDashboardViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var table: UITableView!

    var banners: [WLDashBanner]?
    var presenter: WLDashboardPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "Demo Data from prettylittlething.com"

        presenter?.viewDidLoad()
        table.tableFooterView    = UIView()
        table.register(UINib(nibName: "WLDashCardCell", bundle: nil), forCellReuseIdentifier: "BannerCell")

        table.rowHeight          = UITableViewAutomaticDimension
        table.estimatedRowHeight = 380
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension WLDashboardViewController: WLDashboardViewProtocol {

    func refreshDashboard(banners: [WLDashBanner]) {
        self.banners = banners
        table.reloadData()
    }

    func showError() {
        debugPrint("show Error")
    }

    func showLoading() {
        let activity              = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activity.center           = view.center
        activity.hidesWhenStopped = true
        activity.tag              = 1001
        activity.startAnimating()
        view.addSubview(activity)
    }

    func hideLoading() {
        if let view = view.viewWithTag(1001) as? UIActivityIndicatorView {
            view.stopAnimating()
        }
    }
}

extension WLDashboardViewController: UITableViewDelegate, UITableViewDataSource {

    // MARK: - UITableViewDataSource

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return banners?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath) as? WLDashCardCell {
            if let banner = banners?[indexPath.row] {
                cell.bandData(entity: banner)

                if let imgName = banner.imageName {
                    cell.iconView.sd_setImage(with: URL(string:"\(kImgEndpoint)\(imgName)"))
                }
            }

            return cell
        }

        return UITableViewCell()
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let banner = banners?[indexPath.row] {
            presenter?.showBannerLinkedPage(banner: banner)
        }
    }
}
