//
//  TFViewController.m
//  ReachabilityModel
//
//  Created by yxx on 15/1/19.
//  Copyright (c) 2015年 yxx. All rights reserved.
//

#import "TFViewController.h"
#import <Reachability/Reachability.h>

@interface TFViewController()

-(void)reachabilityChanged:(NSNotification *)note;

@property(retain,nonatomic) Reachability *googleSearch;//谷歌搜索地址
@property(retain,nonatomic) Reachability *localWifiReach;//本地Wifi网络
@property(retain,nonatomic) Reachability *intentnetconnectionReach;//网络连接
@end

@implementation TFViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    self.blockLabel.text = @"没有反射";
    self.notificationLabel.text = @"没有反射";
    self.localWifiBlockLabel.text = @"没有反射";
    self.LocalWifiNotificationLabel.text = @"没有反射";
    self.internetConnectionBlockLabel.text = @"没有反射";
    self.internetConnectionNotificationLabel.text = @"没有反射";
}

-(void)reachabilityChanged:(NSNotification *)note{
    Reachability *reach=(Reachability *)[note object];
    if (reach==self.googleSearch) {
        if ([reach isReachable]) {
            <#statements#>
        }
    }
}


-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
