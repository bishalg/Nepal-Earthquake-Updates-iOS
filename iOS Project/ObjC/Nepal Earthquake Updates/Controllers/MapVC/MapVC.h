//
//  MapVC.h
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/18/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Quake;

@interface MapVC : UIViewController

@property (strong, nonatomic) NSDictionary *dict;
@property (strong, nonatomic) Quake *quake;

@end
