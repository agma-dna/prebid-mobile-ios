//
//  PrebidFeedTableViewController.swift
//  OpenXInternalTestApp
//
//  Copyright © 2020 OpenX. All rights reserved.
//

import UIKit

class PrebidFeedTableViewController: UITableViewController, ConfigurableViewController, PBMBannerViewDelegate {
    
    var showConfigurationBeforeLoad = false
    var testCases: [TestCaseForTableCell] = []
    
    var adapter: PrebidConfigurableController?
    
    var loadAdClosure: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIView()
        tableView.backgroundView?.backgroundColor = UIColor.lightGray

        tableView.register(UINib(nibName: "DummyTableViewCell", bundle: nil), forCellReuseIdentifier: "DummyTableViewCell")
        tableView.register(UINib(nibName: "FeedAdTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedAdTableViewCell")
        tableView.register(UINib(nibName: "FeedGAMAdTableViewCell", bundle: nil), forCellReuseIdentifier: "FeedGAMAdTableViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if showConfigurationBeforeLoad, let configurationController = adapter?.configurationController() {
            showConfigurationBeforeLoad = false
            let navigator = UINavigationController(rootViewController: configurationController)
            present(navigator, animated: true, completion: nil)

            configurationController.loadAd = loadAdClosure
        } else {
            self.loadAdClosure?()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10000;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?

        let testCase = testCases[indexPath.row % self.testCases.count]
        
        testCase.configurationClosureForTableCell?(&cell)
       
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 305;
    }
    
    // MARK: - PBMBannerViewDelegate
    
    func bannerViewPresentationController() -> UIViewController? {
        return self
    }
    
    func bannerViewDidReceiveAd(_ bannerView: PBMBannerView, adSize: CGSize) {
    }
    
    func bannerView(_ bannerView: PBMBannerView, didFailToReceiveAdWithError error: Error?) {
    }
    
    func bannerViewWillPresentModal(_ bannerView: PBMBannerView) {
    }
    
    //TODO: do we need this ??
    func bannerViewWillDismissModal(_ bannerView: PBMBannerView) {
    }
    
    func bannerViewDidDismissModal(_ bannerView: PBMBannerView) {
    }
    
    func bannerViewWillLeaveApplication(_ bannerView: PBMBannerView) {
    }
}
