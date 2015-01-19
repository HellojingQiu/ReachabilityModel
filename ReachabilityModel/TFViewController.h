//
//  TFViewController.h
//  ReachabilityModel
//
//  Created by yxx on 15/1/19.
//  Copyright (c) 2015年 yxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *blockLabel;
@property (weak, nonatomic) IBOutlet UILabel *notificationLabel;

@property (weak, nonatomic) IBOutlet UILabel *localWifiBlockLabel;
@property (weak, nonatomic) IBOutlet UILabel *LocalWifiNotificationLabel;

@property (weak, nonatomic) IBOutlet UILabel *internetConnectionBlockLabel;
@property (weak, nonatomic) IBOutlet UILabel *internetConnectionNotificationLabel;

@end
