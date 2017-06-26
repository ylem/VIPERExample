//
//  WLFruitListViewController.swift
//  FruitApp
//
//  Created by Wei Lu on 21/06/2017.
//  Copyright © 2017 Wei Lu. All rights reserved.
//

import UIKit

class WLFruitListViewController: WLBaseViewController {

    let kCellClassName                   = "WLFruitListCell"

    var presenter: WLFruitListPresenterProtocol?
    var datasource: WLSingleSectionArrayTableViewDataSource<WLFruit>?

    var collectionView: UICollectionView?
    var refreshController                = UIRefreshControl()

    /// variables for vc transition
    var selectedImageView: UIImageView?
    var selectedImageFrameInView: CGRect = .zero
    let moveTransition                   = WLMoveImageTransition()

    var fruits: [WLFruit]? {
        didSet {
            collectionView?.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        doLayout()
        
        presenter?.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func doLayout() {
        self.view.backgroundColor = UIColor.appOrange

        // add collectionView before others
        addCollectionView()

        // add refrsh controller
        if let cv = collectionView {
            if #available(iOS 10, *) {
                cv.refreshControl       = refreshController
                cv.alwaysBounceVertical = true
            } else {
                cv.addSubview(refreshController)
            }
            refreshController.addTarget(self, action: #selector(WLFruitListViewController.reloadData), for: .valueChanged)
        }
    }

    private func addCollectionView() {
        let kPagePadding: CGFloat = 10

        // show 2 columns (cards) in one row.
        let width                 = view.frame.width / 2 - kPagePadding * 2
        let height                = width + 40

        // init collection layout
        let itemSize              = CGSize(width: width, height: height)
        let layout                = WLFruitListFlowLayout(itemSize: itemSize)
        collectionView            = UICollectionView(frame: .zero, collectionViewLayout: layout)

        guard let cv = collectionView else {
            return
        }

        cv.register(UINib(nibName: kCellClassName, bundle: nil), forCellWithReuseIdentifier: kCellClassName)
        cv.backgroundColor  = UIColor.appOrange
        cv.decelerationRate = UIScrollViewDecelerationRateFast
        cv.dataSource       = self
        cv.delegate         = self

        view.addSubview(cv)

        cv.translatesAutoresizingMaskIntoConstraints                                                       = false
        cv.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: kPagePadding).isActive     = true
        cv.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: -kPagePadding).isActive = true
        cv.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: kPagePadding).isActive          = true
        cv.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -kPagePadding).isActive       = true

    }

    func reloadData() {
        presenter?.interactor?.startFetchFruits()
    }
}

extension WLFruitListViewController: WLFruitListViewProtocol {

    func showList(fruits: [WLFruit]?) {
        self.fruits = fruits
    }

    func showLoading() {
        refreshController.beginRefreshing()
    }

    func hideLoading() {
        refreshController.endRefreshing()
    }

    func showError() {
        // show error message - no design for this demo

        let alert = UIAlertController(title: "Simple Error handle - No fruits", message: "make sure mock server has been setup and running, see README for more info", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancel)

        self.present(alert, animated: true, completion: nil)
    }

}

extension WLFruitListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fruits?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellClassName, for: indexPath) as? WLFruitListCell {

            if  let fruit     = fruits?[indexPath.row],
                let viewModel = WLFruitViewModel(fruit: fruit) {
                cell.bindData(viewModel: viewModel)
            }

            return cell
        }

        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let fruit = fruits?[indexPath.row] {
            if let cell = collectionView.cellForItem(at: indexPath) as? WLFruitListCell {
                selectedImageView        = cell.typeIconView
                selectedImageFrameInView = view.convert(cell.typeIconView.frame, from: cell.typeIconView.superview)
            }

            presenter?.showDetailPage(fruit: fruit)
        }
    }
}

extension WLFruitListViewController: UIViewControllerTransitioningDelegate, WLMoveImageTransitionProtocol {

    func didTransitionBegin() {
        selectedImageView?.isHidden = true
    }

    func didTransitionEnd() {
        selectedImageView?.isHidden = false
    }

    func sourceImageView() -> UIImageView? {
        let result   = UIImageView(frame: selectedImageFrameInView)
        result.image = selectedImageView?.image

        return result
    }

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return moveTransition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return moveTransition
    }
}

