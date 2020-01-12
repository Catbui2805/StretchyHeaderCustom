//
//  HomeViewController.swift
//  StretchyHeaderCustom
//
//  Created by Nguyen Tran Cong on 1/7/20.
//  Copyright © 2020 Nguyen Tran. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var padding: CGFloat = 16
    
    var headerView: HeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
}

extension HomeViewController {
    func setupViews() {
        configureRegister()
        setupCollectionView()
    }
    
    func configureRegister() {
        collectionView.register(UINib(nibName: "HomeCell", bundle: nil),
                                forCellWithReuseIdentifier: "HomeCell")
        collectionView.register(HeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "HeaderView")
    }
    
    func setupCollectionView() {
        let layout: UICollectionViewFlowLayout = StretchyHeaderLayout()
        
        collectionView!.collectionViewLayout = layout
        collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // MARK:  configure animation
        //        let contentOffsetY = scrollView.contentOffset.y
        //        print(contentOffsetY)
        //
        //        if contentOffsetY > 0 {
        //            headerView?.animator.fractionComplete = 0
        //            return
        //        }
        //        headerView?.animator.fractionComplete = abs(contentOffsetY) / 100
        
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as? HomeCell else {
            fatalError("Can't dequeue reusable cell")
        }
        
        cell.backgroundColor = .black
        return cell
    }
    
    // MARK:  Header view
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView
        return headerView ?? UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 340)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - padding * 2, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

