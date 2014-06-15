//
//  SwiftTestMainViewController.swift
//  iosSwiftTest
//
//  Created by linminglu on 14-6-14.
//  Copyright (c) 2014年 ugame. All rights reserved.
//

import UIKit

class SwiftTestMainViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var  fontsList: Array<String>=[]
    var  fonts: Dictionary<String,String[]> = [:]
    var  myTableView : UITableView?
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let unsortFontNames = UIFont.familyNames()  as String[]
        fontsList =  sort(unsortFontNames);
        for  fontsListItem in  fontsList
        {
             let unsortedFontNames =  UIFont.fontNamesForFamilyName(fontsListItem) as String[]
            fonts[fontsListItem] = unsortedFontNames;
        }
        setupView();
        
        // Do any additional setup after loading the view.
    }
    func setupView()
    {
        self.myTableView = UITableView(frame:self.view!.frame)
        self.myTableView!.delegate = self
        self.myTableView!.dataSource = self
        self.myTableView!.registerClass(UITableViewCell.self,forCellReuseIdentifier:"cell");
        self.view?.addSubview(self.myTableView);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView : UITableView) ->Int
    {
        return countElements(fontsList)
    }
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        let key = fontsList[section];
        let array = fonts[key];
        return array!.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell",forIndexPath:indexPath) as UITableViewCell
        
        let key = fontsList[indexPath.section];
        let array = fonts[key];
        let fontName = array![indexPath.row];
//        let fontName = fontsList[indexPath.row]
        cell.textLabel.text = fontName + ":我爱cocos2d-x"
        cell.textLabel.font = UIFont(name:fontName,size:UIFont.systemFontSize())
        return cell;
    }
    
    func tableView(tableView: UITableView!,heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 45.0;
        
    }
    
}
