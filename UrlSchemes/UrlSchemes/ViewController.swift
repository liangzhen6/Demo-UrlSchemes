//
//  ViewController.swift
//  UrlSchemes
//
//  Created by shenzhenshihua on 2018/3/13.
//  Copyright © 2018年 shenzhenshihua. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    /*
     //直接跳转到系统对应的设置页面
     电池电量 App-Prefs:root=BATTERY_USAGE
     通用设置 App-Prefs:root=General
     存储空间 App-Prefs:root=General&path=STORAGE_ICLOUD_USAGE/DEVICE_STORAGE
     蜂窝数据 App-Prefs:root=MOBILE_DATA_SETTINGS_ID
     Wi-Fi 设置 App-Prefs:root=WIFI
     蓝牙设置 App-Prefs:root=Bluetooth
     定位设置 App-Prefs:root=Privacy&path=LOCATION
     辅助功能 App-Prefs:root=General&path=ACCESSIBILITY
     关于手机 App-Prefs:root=General&path=About
     键盘设置 App-Prefs:root=General&path=Keyboard
     显示设置 App-Prefs:root=DISPLAY
     声音设置 App-Prefs:root=Sounds
     App Store 设置 App-Prefs:root=STORE
     墙纸设置 App-Prefs:root=Wallpaper
     */
    
    /*
     系统内置
     telprompt:10010  tel:10010
     //拨打电话
     facetime://user@example.com
     //facetime 通话
     facetime-audio://user@example.com
     // facetime 语音
     sms:86-130-9999-9999&body=你好
     //body 为信息内容 可省略 body
     mailto:foo@example.com?cc=bar@example.com&subject=Greetings%20from%20Cupertino!&body=Wish%20you%20were%20here!
     //第一个为发送给谁 参数cc为抄送给谁 subject 为邮件的主题 body为内容 后面的参数都可以省略
     itms-apps:itms-apps://itunes.apple.com/cn/app/idXXXXXX?mt=8&action=write-review
     //跳转appstore去评价 注意把id后面的XXXXX换成自己应用的号码。
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //这里注意一下要对scheme 进行encoding 编码，否则汉字 空格 会崩溃
        let string = "App-Prefs:root=Wallpaper".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        //data=xxx为传递参数
        let url = URL.init(string: string!)
        if UIApplication.shared.canOpenURL(url!) {
            let dict = [:] as [String:Any]
            //iOS10 之后 open方法增加了 参数options可以传递一个字典 携带一些信息给被跳转的app处理， 还有一个闭包，来传递是否跳转成功？
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url!, options: dict, completionHandler: { (res) in
                    print("跳转是否成功?\(res)")
                })
            } else {
                // Fallback on earlier versions
                UIApplication.shared.openURL(url!)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

