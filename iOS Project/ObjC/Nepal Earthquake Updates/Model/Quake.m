//
//  Quake.m
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/18/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

#import "Quake.h"

NSString *const JSONPropertiesKeyEpicenter      = @"epicenter";
NSString *const JSONPropertiesKeyMagnitude      = @"magnitude";
NSString *const JSONPropertiesKeyPlaceLatLong   = @"latlon";
NSString *const JSONPropertiesKeyTime           = @"eqdt";

@implementation Quake

- (id)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.epicenter = [dict objectForKey:JSONPropertiesKeyEpicenter];
        self.magnitude = [dict objectForKey:JSONPropertiesKeyMagnitude];
        self.eqdt      = [dict objectForKey:JSONPropertiesKeyTime];
        
        NSString *latlon    = [dict objectForKey:JSONPropertiesKeyPlaceLatLong];
        
        NSRange rangeLat    = [latlon rangeOfString:@"Lat:"];
        rangeLat.location   = rangeLat.location + rangeLat.length;
        rangeLat.length     = 6;
        NSRange rangeLong   = [latlon rangeOfString:@"Long:"];
        rangeLong.location  = rangeLong.location + rangeLong.length;
        rangeLong.length    = 6;
        
        NSString *strLat;
        NSString *strLong;
        @try {
            strLat  = [latlon substringWithRange:rangeLat];
            strLong = [latlon substringWithRange:rangeLong];
        }
        @catch (NSException *exception) {
            
        }
        
        CLLocationCoordinate2D center;
        center.latitude = [strLat floatValue];
        center.longitude = [strLong floatValue];
        self.center = center;
    }
    return self;
}

@end
