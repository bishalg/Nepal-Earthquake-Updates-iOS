//
//  EarthQuakeListTVC.h
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/18/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
// Model
@class Quake;

@interface EarthQuakeListTVC : UITableViewController

- (void)networkRequestWithURL:(NSString *)endString andKey:(NSString *)key;

@property (strong, nonatomic) NSArray *quakes;
@property (strong, nonatomic) Quake   *selectedQuake;

@end
