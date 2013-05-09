//
//  HelloWorldViewController.m
//  LBS
//
//  Created by Karthik on 09/05/13.
//  Copyright (c) 2013 Karthik. All rights reserved.
//

#import "HelloWorldViewController.h"

@interface HelloWorldViewController ()

@end

@implementation HelloWorldViewController
@synthesize accuracy,latitude,longitute,location,mapview;

- (void)viewDidLoad
{
    self.location=[[CLLocationManager alloc]init];
    location.delegate=self;
    location.desiredAccuracy=kCLLocationAccuracyBest;
    location.distanceFilter=kCLDistanceFilterNone;
    [location startUpdatingLocation];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)locationmanager:(CLLocationManager *) manager didUpDateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSString *lat=[[NSString alloc]initWithFormat:@"%f",newLocation.coordinate.latitude];
    latitude.text=lat;
    NSString *lon=[[NSString alloc]initWithFormat:@"%f",newLocation.coordinate.longitude];
    longitute.text=lon;
    NSString *acc=[[NSString alloc]initWithFormat:@"%f",newLocation.horizontalAccuracy];
    accuracy.text=acc;
    
    MKCoordinateSpan span;
    span.latitudeDelta=.01;
    span.longitudeDelta=.01;
    MKCoordinateRegion region;
    region.center=newLocation.coordinate;
    region.span=span;
    [mapview setRegion:region animated:TRUE];
    
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString *msg=[[NSString alloc]initWithFormat:@"Error obtained"];
    UIAlertView*alert;
    alert=[[UIAlertView alloc]initWithTitle:@"error" message:msg
delegate:self
cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil];
    [alert show];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
