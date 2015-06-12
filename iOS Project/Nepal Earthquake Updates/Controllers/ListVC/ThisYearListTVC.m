//
//  ThisYearListTVC.m
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/18/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

#import "ThisYearListTVC.h"

@interface ThisYearListTVC ()

@end

@implementation ThisYearListTVC

// Do any additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self networkRequestWithURL:@"thisyr.php" andKey:@"thisyr"];
}

// Dispose of any resources that can be recreated.
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
