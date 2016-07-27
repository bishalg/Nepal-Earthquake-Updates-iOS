//
//  APIRequest.m
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/19/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//
//
/*
 * Sample JSON
 {
 epicenter: "Dolakha (ML 4.4)"
 magnitude: "4.4"
 eqdt: "2015-05-17 20:40"
 latlon: "Lat: 27.84 Long: 86.24"
 }
 */

#import <UIKit/UIKit.h> // for networkActivityIndicator
// Header
#import "APIRequest.h"
// Model
#import "Quake.h"

@interface APIRequest ()

@property (strong, nonatomic) NSString *endString;
@property (strong, nonatomic) NSString *key;
@property (strong, nonatomic) NSMutableArray *quakes;

@end

@implementation APIRequest

- (APIRequest *)initWithURL:(NSString *)URLstring andKey:(NSString *)key {
    if (self = [super init]) {
        self.endString = URLstring;
        self.key = key;
    }
    return self;
}

- (void)startWithCompletion:(BGSessionBlock)block {
    self.sessionBlock = block;
    NSString *urlString = [NSString stringWithFormat:@"http://mls.com.np/MLS/nepalquake/%@", self.endString];
    
    NSLog(@"Request URL %@", urlString);
    
    NSURLSessionConfiguration *sessionConfig =
    [NSURLSessionConfiguration defaultSessionConfiguration];
    
    // 1
    sessionConfig.allowsCellularAccess = NO;
    
    // 2
    [sessionConfig setHTTPAdditionalHeaders:
     @{@"Accept": @"application/json"}];
    
    // 3
    sessionConfig.timeoutIntervalForRequest = 30.0;
    sessionConfig.timeoutIntervalForResource = 60.0;
    sessionConfig.HTTPMaximumConnectionsPerHost = 1;
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    // 1
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 2
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url
    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            NSHTTPURLResponse *httpResp =
            (NSHTTPURLResponse*) response;
            if (httpResp.statusCode == 200) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSError *jsonError;
                    NSDictionary *filesJSON = [NSJSONSerialization
                                               JSONObjectWithData:data
                                               options:NSJSONReadingAllowFragments
                                               error:&jsonError];
                    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
                    if (!jsonError) {
                        [self parseJson2Object:filesJSON withKey:self.key];
                    } else {
                        self.sessionBlock(nil, error);
                    }
                });
            }
        } else {
            // HANDLE ERROR //
            self.sessionBlock(nil, error);
        }
    }];
    [dataTask resume];
}

- (void)parseJson2Object:(NSDictionary *)filesJSON withKey:(NSString *)key {
    self.quakes = [[NSMutableArray alloc] initWithCapacity:100];
    for (NSDictionary *dict in filesJSON[key]) {
        Quake *quake = [[Quake alloc] initWithDictionary:dict];
        [self.quakes addObject:quake];
    }
    self.sessionBlock(self.quakes, nil);
}

@end
