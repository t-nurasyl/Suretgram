//
//  SecondViewController.swift
//  Suretgram
//
//  Created by Нурасыл on 03.07.2018.
//  Copyright © 2018 Нурасыл. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher // ya poterya
import SwiftyJSON

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var url = "https://apinsta.herokuapp.com/u/"
    var images : [String] = []
    var label = ""
    var text = ""
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        request()
        title = label
        tableView.dataSource = self
        tableView.delegate = self
        print(images)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissBtn(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let url = URL(string: images[indexPath.row])
        cell.instaImage.kf.setImage(with: url)
//        cell.instaLabel.text! = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 414
    }
    
    func request(){ //nurasyl pedik
        Alamofire.request(url+label).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                let userURL = swiftyJsonVar["graphql"]["user"]
                let edgeURL = userURL["edge_owner_to_timeline_media"]["edges"]
                for n in edgeURL{
                    let imageURL = n.1["node"]["display_url"].string
                    self.images.append(imageURL!)
                }
//                let nodeURL = edgeURL["node"]["edge_media_to_caption"]
//                let textURL = nodeURL["edges"]
//                let descURL = textURL["node"]["text"].string
//                self.text = descURL!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    }
            }
            
        }
    }

}
