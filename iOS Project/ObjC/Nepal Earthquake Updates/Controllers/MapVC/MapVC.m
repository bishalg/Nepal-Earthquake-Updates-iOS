//
//  MapVC.m
//  Nepal Earthquake Updates
//
//  Created by Bishal Ghimire on 5/18/15.
//  Copyright (c) 2015 Big B Soft. All rights reserved.
//

#import "MapVC.h"
#import "Quake.h"
@import MapKit;

@import MapKit;

@interface MapVC ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation MapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) { // iOS8+
        // Sending a message to avoid compile time error
        [[UIApplication sharedApplication] sendAction:@selector(requestWhenInUseAuthorization)
                                                   to:self.locationManager
                                                 from:self
                                             forEvent:nil];
    }
    
    //declare latitude and longitude of map center
    CLLocationCoordinate2D center = self.quake.center;
    
    //declare span of map (height and width in degrees)
    MKCoordinateSpan span;
    span.latitudeDelta = 2;
    span.longitudeDelta = 1;
    
    //add center and span to a region,
    //adjust the region to fit in the mapview
    //and assign to mapview region
    MKCoordinateRegion region;
    region.center = center;
    region.span = span;
    self.mapView.region = [self.mapView regionThatFits:region];
    
    [self.mapView setRegion:region animated:YES];

    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc] init];
    myAnnotation.coordinate = center;
    
    myAnnotation.title = self.quake.epicenter;
    myAnnotation.subtitle = self.quake.eqdt;
    [self.mapView addAnnotation:myAnnotation];
    
    CLAuthorizationStatus authorizationStatus= [CLLocationManager authorizationStatus];
    
    if (authorizationStatus == kCLAuthorizationStatusAuthorizedAlways ||
        authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.locationManager startUpdatingLocation];
        self.mapView.showsUserLocation = YES;
    }
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
