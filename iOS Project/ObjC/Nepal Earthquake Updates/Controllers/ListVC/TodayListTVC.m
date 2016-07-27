//
//  TodayListTVC.m
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/18/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

// Header
#import "TodayListTVC.h"
// Navigate 2 VC
#import "MapVC.h"
#import "Nepal_Earthquake_Updates-Bridging-Header.h"
// Swift-ObjC Bridge File
#import "Nepal_Earthquake_Updates-Swift.h"

@class GraphVC;
// #import "GraphVC.swift"

@interface TodayListTVC ()

@end

@implementation TodayListTVC

// Do any additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeNetworkRequest];
}

// Dispose of any resources that can be recreated.
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)makeNetworkRequest {
    [self networkRequestWithURL:@"today.php" andKey:@"today"];
}

- (void)refreshButtonAction:(id)sender {
    [self makeNetworkRequest];
}

- (void)graphButtonAction:(id)sender {
    [self performSegueWithIdentifier:@"GraphVCSegue" sender:sender];
}

#pragma mark - Navigation
 
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
    if ([segue.identifier isEqualToString:@"GraphVCSegue"]) {
        // Pass the selected object to the new view controller.
        GraphVC *graphVC = (GraphVC *)segue.destinationViewController;
        graphVC.quakes = self.quakes;
        // graphVC.name = @"this is name";
    }
}



@end
