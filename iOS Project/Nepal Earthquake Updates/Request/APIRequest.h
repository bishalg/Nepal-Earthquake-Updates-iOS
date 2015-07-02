//
//  APIRequest.h
//  Nepal Earthquake Updates
//
//  Created by Leapfrog on 5/19/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

#import <Foundation/Foundation.h>
@class APIRequest;

typedef void (^BGSessionBlock)(NSArray *quakes,
                               NSError *error);

@interface APIRequest : NSObject

// NS_DESIGNATED_INITIALIZER
- (APIRequest *)initWithURL:(NSString *)URLstring andKey:(NSString *)key;
- (void)startWithCompletion:(BGSessionBlock)block;

@property (nonatomic, copy) BGSessionBlock sessionBlock;

@end
