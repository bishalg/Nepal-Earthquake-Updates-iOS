//
//  Quake.h
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/18/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface Quake : NSObject

@property (strong, nonatomic) NSString *epicenter;
@property (strong, nonatomic) NSString *magnitude;
@property (strong, nonatomic) NSString *eqdt;
@property (nonatomic) CLLocationCoordinate2D center;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
