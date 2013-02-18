//
//  SEBViewController.m
//  BasicMaps
//
//  Created by Sebs on 2/12/13.
//  Copyright (c) 2013 Sebs. All rights reserved.
//

#import "SEBViewController.h"


@interface SEBViewController ()
@end

@implementation SEBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(initializeLocationManager:) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CLLocationManagerDelegate methods

- (void)initializeLocationManager:(NSTimer*) timer
{
    if (self.locationManager == Nil)
    {
        NSLog(@"initializing");
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
        [self.locationManager setDistanceFilter:1000];
        [self.locationManager startUpdatingLocation];
    }

    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized)
    {
        NSLog(@"starting update location");
        [self.locationManager startUpdatingLocation];
        if (timer) {
            NSLog(@"invalidating timer");
            [timer invalidate];
            timer = Nil;
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    [self addPinToMapAtLocation:location];
}


- (void)addPinToMapAtLocation:(CLLocation *)location
{
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    MKCoordinateSpan span = {0.03, 0.03};
    MKCoordinateRegion region = {location.coordinate, span};
    pin.coordinate = location.coordinate;
    pin.title = @"foo";
    pin.subtitle = @"bar";
    [self.mapView addAnnotation:pin];
    [self.mapView setRegion:region animated:YES];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Oops..");
}

@end
