//
//  SubscriptionViewController.swift
//  SportexcProject
//
//  Created by Naglaa Ogabih on 04/04/2022.
//

import UIKit
import Alamofire
class SubscriptionViewController: UIViewController {
    @IBOutlet weak var dataTableView: UITableView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var roundedView: UIView!{
        didSet{
            roundedView.layer.borderWidth = 1
            roundedView.layer.borderColor = UIColor(named: "CustomYellow")?.cgColor
            roundedView(view: roundedView)
        }
    }
    @IBOutlet weak var yellowRondedView: UIView!{
        didSet{
            roundedView(view: yellowRondedView)
        }
    }
    @IBOutlet weak var cancelledLabel: UILabel!
    @IBOutlet weak var waitingPaymentLabel: UILabel!
    @IBOutlet weak var existingProgram: UILabel!
    @IBOutlet weak var waitingLabel: UILabel!
    @IBOutlet weak var currentSubscriptionBtn: UIButton!{
        didSet{
            currentSubscriptionBtn.layer.borderWidth = 1
            currentSubscriptionBtn.layer.borderColor = UIColor(named: "CustomYellow")?.cgColor
            currentSubscriptionBtn.layer.cornerRadius = 18
            currentSubscriptionBtn.clipsToBounds = true
        }
    }
    @IBOutlet weak var previousSubscriptionBtn: UIButton!{
        didSet{
            previousSubscriptionBtn.layer.borderWidth = 1
            previousSubscriptionBtn.layer.borderColor = UIColor(named: "CustomYellow")?.cgColor
            previousSubscriptionBtn.layer.cornerRadius = 18
            previousSubscriptionBtn.clipsToBounds = true
            
        }
    }
    var statusArray : [Status]?
    var currentSubsBtn = true
    var previousSubsBtn = false
    var currentSubscriptions : [Subscription]?
    var lastSubscriptions : [Subscription] = []
    var determineCell = "current"
    override func viewDidLoad() {
        super.viewDidLoad()
        cstatusApi()
        viewsSettings()
        dataTableView.showsVerticalScrollIndicator = false
        dataTableView.separatorStyle = .none
        currentSubscriptionsApi()
        previousSubscriptionBtn.titleLabel?.textColor = .black
        navigationItem.title = "Child Subscriptions"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes

        let backButton = UIBarButtonItem()
        backButton.image = UIImage(systemName: "chevron.backward")
        navigationItem.leftBarButtonItem = backButton
        

    }
    @IBAction func currentSubscriptionBtnPressed(_ sender: Any) {
        currentSubscriptionBtn.backgroundColor = UIColor(named: "CustomYellow")
        currentSubscriptionBtn.titleLabel?.textColor = .white
        previousSubscriptionBtn.backgroundColor = .white
        previousSubscriptionBtn.titleLabel?.textColor = .black
        determineCell = "current"
        currentSubscriptionsApi()
    }
    @IBAction func previousSubscriptionBtnPressed(_ sender: Any) {
        previousSubscriptionBtn.backgroundColor = UIColor(named: "CustomYellow")
        previousSubscriptionBtn.titleLabel?.textColor = .white
        currentSubscriptionBtn.backgroundColor = .white
        currentSubscriptionBtn.titleLabel?.textColor = .black
        determineCell = "last"
        lastSubscriptionsApi()
    }
    func viewsSettings(){
        circleView(view: redView)
        circleView(view: yellowView)
        circleView(view: greenView)
        circleView(view: blueView)
    }
    func circleView(view: UIView){
        view.layer.cornerRadius = redView.frame.size.width/2
        view.clipsToBounds = true
    }
    func roundedView(view: UIView){
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
    }
    func cstatusApi(){
        let decoder = JSONDecoder()
        let params:[String:Any] = ["lang": Locale.current.languageCode!]
        let headers: HTTPHeaders = [:]
        Request.req(url:"https://sportexcbh.com/api/get_status.php", headers: headers, params: params, meth: .post) { [self](data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let cardDataDecoded = try decoder.decode(StatusModel.self, from: data)
                    self.statusArray = cardDataDecoded.status
                    
                    cancelledLabel.text = statusArray?[0].statusName
                    existingProgram.text = statusArray?[1].statusName
                    waitingLabel.text = statusArray?[2].statusName
                    waitingPaymentLabel.text = statusArray?[3].statusName
                    greenView.layer.backgroundColor = hexStringToUIColor(hex: statusArray?[1].statusColor ?? "#FFC900").cgColor
                    yellowView.layer.backgroundColor = hexStringToUIColor(hex: statusArray?[3].statusColor ?? "#FFC900").cgColor
                    redView.layer.backgroundColor = hexStringToUIColor(hex: statusArray?[0].statusColor ?? "#E91B33").cgColor
                    blueView.layer.backgroundColor = hexStringToUIColor(hex: statusArray?[2].statusColor ?? "#18ACE7").cgColor
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func currentSubscriptionsApi(){
        let decoder = JSONDecoder()
        let params:[String:Any] = [
            "client_id": "1",
            "lang": Locale.current.languageCode
        ]
        let headers: HTTPHeaders = [:]
        Request.req(url:"https://sportexcbh.com/api/get_child_with_subscription_current.php", headers: headers, params: params, meth: .post) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let currentSubscriptionsDataDecoded = try decoder.decode(CurrentSubscriptionsModel.self, from: data)
                    self.currentSubscriptions = currentSubscriptionsDataDecoded.subscription
                    DispatchQueue.main.async {
                        self.dataTableView.reloadData()
                    }
                } catch{
                    print(error)
                }
            }
        }
    }
    func lastSubscriptionsApi(){
        let decoder = JSONDecoder()
        let params:[String:Any] = [
            "client_id": "1",
            "lang": Locale.current.languageCode
        ]
        let headers: HTTPHeaders = [:]
        Request.req(url:"https://sportexcbh.com/api/get_child_with_subscription_last.php", headers: headers, params: params, meth: .post) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            if let data = data {
                do {
                    let lastSubscriptionsDataDecoded = try decoder.decode(CurrentSubscriptionsModel.self, from: data)
                    self.lastSubscriptions = lastSubscriptionsDataDecoded.subscription ?? []
//                    print(self.lastSubscriptions.count)
                    DispatchQueue.main.async {
                        self.dataTableView.reloadData()
                    }
                } catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
