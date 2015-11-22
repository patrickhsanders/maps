//
//  FirstViewController.m
//  Maps
//
//  Created by Aditya Narayan on 11/20/15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property (strong, nonatomic) IBOutlet MKMapView *mapView;

- (IBAction)changeMapType:(UISegmentedControl *)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.mapView.delegate = self;
  CLLocationCoordinate2D locationOfTTT = CLLocationCoordinate2DMake(40.741448, -73.989969);
  MKCoordinateSpan mapSpan = MKCoordinateSpanMake(0.05, 0.05);
  MKCoordinateRegion region = MKCoordinateRegionMake(locationOfTTT,mapSpan);
  [self.mapView setRegion:region];
  
  MKCoordinateRegion adjustedRegion = [_mapView regionThatFits:MKCoordinateRegionMakeWithDistance(locationOfTTT, 500, 500)];
  [_mapView setRegion:adjustedRegion animated:YES];
  //[self.mapView setRegion:region];
  
  MKPointAnnotation *turnToTech = [[MKPointAnnotation alloc] init];
  turnToTech.coordinate = locationOfTTT;
  turnToTech.title = @"TurnToTech";
  turnToTech.subtitle = @"IS AWESOME";
  [_mapView addAnnotation:turnToTech];

  
  
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)changeMapType:(UISegmentedControl *)sender {
    
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
        case 2:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
        default:
            break;
    }
    
//    self.mapView.mapType = MKMapTypeStandard // MKMapTypeHybrid // MKMapTypeSatellite
    
}
@end
