//
//  ViewController.m
//  NotchIconDemo
//
//  Created by Cirno on 2019/3/13.
//  Copyright © 2019 mistylake. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)setNotchIcon{

    /* Label Setting */
    NSString* localizedAppName = [[[NSBundle mainBundle] localizedInfoDictionary]
                                  objectForKey:@"CFBundleDisplayName"];

    UIImage* appIcon = [UIImage imageNamed:@"AppIcon"];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UILabel* localizedAppNameLabel = [[UILabel alloc]initWithFrame:
                                      CGRectMake(20 + 15,0,screenWidth - 40 - 15,20)];
    UIFont* labelFont = [UIFont systemFontOfSize:11.0f];
    localizedAppNameLabel.font = labelFont;
    localizedAppNameLabel.textAlignment = NSTextAlignmentCenter;
    localizedAppNameLabel.text = localizedAppName;
    CGSize localizedAppNameLabelSize = [localizedAppNameLabel.text
                                        sizeWithAttributes:
                                         [NSDictionary dictionaryWithObjectsAndKeys:
                                          labelFont,NSFontAttributeName,nil]
                                        ];
    /* AppIcon Setting */
    UIImageView* appIconImageView = [[UIImageView alloc]initWithFrame:
                                     CGRectMake((screenWidth - localizedAppNameLabelSize.width) / 2 - 15, 3, 15, 15)];
    appIconImageView.layer.masksToBounds = YES;
    appIconImageView.image = appIcon;
    appIconImageView.layer.cornerRadius = 2.0f;
    appIconImageView.layer.borderColor = [UIColor blackColor].CGColor;


    /* Add it to status bar */
    UIWindow* keyWindow = [[UIApplication sharedApplication] keyWindow];
    [keyWindow addSubview:localizedAppNameLabel];
    [keyWindow addSubview:appIconImageView];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView* tableView = [[UITableView alloc]initWithFrame:
                              CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,
                                               [UIScreen mainScreen].bounds.size.height)
                                                         style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    if(UIApplication.sharedApplication.keyWindow.safeAreaInsets.bottom > 0.0){
        [self setNotchIcon];
    }

}


@end
