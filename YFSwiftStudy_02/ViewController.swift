//
//  ViewController.swift
//  YFSwiftStudy_02
//
//  Created by 亚飞 on 2018/4/25.
//  Copyright © 2018年 yafei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (fontTableView.dequeueReusableCell(withIdentifier: "fontCell", for: indexPath)) as UITableViewCell
        cell.textLabel?.text = data[indexPath.row]
        cell.backgroundColor = UIColor.black
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name:self.fontNames[fontRowIndex], size:16)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }

    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "呵呵，再见🤗 See you next Project", "测试测试测试测试测试测试", "123", "Alex", "@@@@@@"]

    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular", "Zapfino", "Gaspar Regular"]

    var fontRowIndex = 0

    var changeFontButton : UIButton!
    var fontTableView : UITableView!

    var changFontBtn :UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.black
        self.initUI()
    }

    func initUI() {
        let kScreenW = self.view.frame.size.width
        let kScreenH = self.view.frame.size.height

        fontTableView = UITableView(frame:CGRect(x: 0 , y: 100 , width: Int(kScreenW), height:35 * data.count))
        fontTableView.backgroundColor = UIColor.black
        fontTableView.dataSource = self
        fontTableView.delegate = self
        fontTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(fontTableView)

        //注册UITableView，fontCell为重复使用cell的Identifier
        fontTableView.register(UITableViewCell.self, forCellReuseIdentifier: "fontCell")

        let button_w:CGFloat = 150.0
        let button_y = (kScreenH - 30 - 150)
        let button_x = (kScreenW - 150) / 2

        changFontBtn = UIButton(type:.custom)
        changFontBtn.setTitle("change", for:.normal)
        changFontBtn.titleLabel?.textColor = UIColor.white
        changFontBtn.titleLabel?.font = UIFont.systemFont(ofSize: 30.0)
        changFontBtn.layer.masksToBounds = true
        changFontBtn.layer.cornerRadius = 75.0
        changFontBtn.frame = CGRect(x:button_x, y:button_y, width:button_w, height:button_w)
        changFontBtn.backgroundColor = UIColor.orange
        changFontBtn.addTarget(self, action: #selector(changeFontAc), for: .touchUpInside)
        self.view.addSubview(changFontBtn)

    }

    @objc func changeFontAc() {
        fontRowIndex = (fontRowIndex + 1) % 5
        fontTableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}






























