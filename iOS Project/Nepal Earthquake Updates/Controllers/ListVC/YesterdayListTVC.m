//
//  YesterdayListTVC.m
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/18/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

#import "YesterdayListTVC.h"

@interface YesterdayListTVC ()

@end

@implementation YesterdayListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeNetworkRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)makeNetworkRequest {
    [self networkRequestWithURL:@"yesterday.php" andKey:@"yesterday"];
}

- (void)refreshButtonAction:(id)sender {
    [self makeNetworkRequest];
}

- (void)graphButtonAction:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
