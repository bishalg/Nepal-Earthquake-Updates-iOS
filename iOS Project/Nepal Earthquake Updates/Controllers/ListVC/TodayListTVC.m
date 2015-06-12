//
//  TodayListTVC.m
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/18/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

#import "TodayListTVC.h"
#import "MapVC.h"

@interface TodayListTVC ()

@end

@implementation TodayListTVC

// Do any additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self networkRequestWithURL:@"today.php" andKey:@"today"];
}

// Dispose of any resources that can be recreated.
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
