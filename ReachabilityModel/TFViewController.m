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
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    __weak typeof(self) weakSelf=self;//weak用于arc中,__block用于mrc中
    
    
    /**
     *  谷歌通知中心代码块写法
     */
    self.googleSearch=[Reachability reachabilityWithHostName:@"www.google.com"];
    self.googleSearch.reachableBlock=^(Reachability *reach){
        NSString *temp=[NSString stringWithFormat:@"谷歌代码块可获得:%@",reach.currentReachabilityString];
        NSLog(@"temp");
        weakSelf.blockLabel.text=temp;
        weakSelf.blockLabel.textColor=[UIColor blackColor];
    };
    
    self.googleSearch.unreachableBlock=^(Reachability *reach){
        NSString *temp=[NSString stringWithFormat:@"谷歌代码块无法获得:%@",reach.currentReachabilityString];
        NSLog(@"%@",temp);
        weakSelf.blockLabel.text=temp;
        weakSelf.blockLabel.textColor=[UIColor redColor];
    };
    
    [self.googleSearch startNotifier];
    
    
    self.localWifiReach=[];
}

#pragma mark - 网络状态改变
//网络状态改变
-(void)reachabilityChanged:(NSNotification *)note{
    Reachability *reach=(Reachability *)[note object];
    if (reach==self.googleSearch) {
        //判断是否可达
        if ([reach isReachable]) {
            NSString *temp=[NSString stringWithFormat:@"谷歌通知中心可获得:%@",
                            reach.currentReachabilityString];
            NSLog(@"temp");
            self.notificationLabel.text=temp;
            self.notificationLabel.textColor=[UIColor blackColor];
        }else{
            NSString *temp=[NSString stringWithFormat:@"谷歌通知中心无法获得获得:%@",
                            reach.currentReachabilityString];
            NSLog(@"%@",temp);
            
            self.notificationLabel.text=temp;
            self.notificationLabel.textColor=[UIColor redColor];
        }
    }else if(reach==self.localWifiReach){
        if ([reach isReachable]) {
            NSString *temp=[NSString stringWithFormat:@"本地WIFI通知中心可获得:%@",
                            reach.currentReachabilityString];
            NSLog(@"temp");
            self.LocalWifiNotificationLabel.textColor=[UIColor blackColor];
            self.LocalWifiNotificationLabel.text=temp;
        }else{
            NSString *temp=[NSString stringWithFormat:@"本地WIFI通知中心无法获得:%@",
                            reach.currentReachabilityString];
            NSLog(@"%@",temp);
            self.LocalWifiNotificationLabel.text=temp;
            self.LocalWifiNotificationLabel.textColor=[UIColor redColor];
        }
    }else if (reach==self.intentnetconnectionReach){
        if ([reach isReachable]) {
            NSString *temp=[NSString stringWithFormat:@"网络连接通知中心可获得:%@",
                            reach.currentReachabilityString];
            NSLog(@"temp");
            self.internetConnectionNotificationLabel.text=temp;
            self.internetConnectionNotificationLabel.textColor=[UIColor blackColor];
        }else{
            NSString *temp=[NSString stringWithFormat:@"网络连接通知中心无法获得:%@",
                            reach.currentReachabilityString];
            NSLog(@"%@",temp);
            self.internetConnectionNotificationLabel.text=temp;
            self.internetConnectionNotificationLabel.textColor=[UIColor redColor];
        }
    }
    
    
}


-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
