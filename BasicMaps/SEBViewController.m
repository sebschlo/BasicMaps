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

    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [self.locationManager setDistanceFilter:1000];
    [self.locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CLLocationManagerDelegate methods

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
    NSLog(@"Oops.. sh*t hit the fan...");
}

@end
