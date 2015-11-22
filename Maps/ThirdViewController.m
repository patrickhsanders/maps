//
//  ThirdViewController.m
//  Maps
//
//  Created by Patrick Sanders on 20.11.15.
//  Copyright © 2015 turntotech.io. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (nonatomic) MGLMapView *mapView;

@end

@implementation ThirdViewController{
    UISegmentedControl *mapType;
    NSMutableArray *mapPoints;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    
    self.mapView = [[MGLMapView alloc] initWithFrame:self.view.bounds];//@"mapbox://styles/patrickhsanders/cih8k6ca1000zrom4yy4qiqqk"]];
    self.mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.mapView.delegate = self;
    // set the map's center coordinate
    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(40.741448, -73.989969)
                            zoomLevel:16
                             animated:NO];
    [self.view addSubview:self.mapView];
    
    
    MGLPointAnnotation *turnToTech = [[MGLPointAnnotation alloc] init];
    turnToTech.coordinate = CLLocationCoordinate2DMake(40.741448, -73.989969);
    turnToTech.title = @"TurnToTech";
    turnToTech.subtitle = @"is awesome";
    mapPoints = [[NSMutableArray alloc] init];
    [mapPoints addObject:turnToTech];
    [self.mapView addAnnotation:turnToTech];
    
    mapType = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Map",@"Emerald",@"Sat",@"Light",nil]];
    mapType.frame = CGRectMake(6, self.view.bounds.size.height-85, 225, 29);
    [mapType addTarget:self action:@selector(changeMapType:) forControlEvents:UIControlEventValueChanged];
    mapType.selectedSegmentIndex = 0;
    [self.view addSubview:mapType];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)mapView:(MGLMapView *)mapView annotationCanShowCallout:(id <MGLAnnotation>)annotation {
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (MGLAnnotationImage *)mapView:(MGLMapView *)mapView imageForAnnotation:(id <MGLAnnotation>)annotation
{
    MGLAnnotationImage *annotationImage = [mapView dequeueReusableAnnotationImageWithIdentifier:@"pin"];
    
    if ( ! annotationImage)
    {
        UIImage *image = [UIImage imageNamed:@"pin"];
        annotationImage = [MGLAnnotationImage annotationImageWithImage:image reuseIdentifier:@"pin"];
    }
    
    return annotationImage;
}

- (void)changeMapType:(UISegmentedControl *)sender {
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            self.mapView.styleURL = [NSURL URLWithString:@"asset://styles/streets-v8.json"];
            break;
            
        case 1:
            self.mapView.styleURL = [NSURL URLWithString:@"mapbox://styles/patrickhsanders/cih9eg7x5002from4p2bz7p33"];
            break;
            
        case 2:
            self.mapView.styleURL = [NSURL URLWithString:@"asset://styles/satellite-v8.json"];
            break;
            
        case 3:
            self.mapView.styleURL = [NSURL URLWithString:@"asset://styles/light-v8.json"];
            break;
            
        default:
            break;
    }
    
    if([mapPoints count] != 0){
        for(MGLPointAnnotation *annotation in mapPoints){
            [self.mapView addAnnotation:annotation];
            NSLog(@"map point");
        }
    }
}

@end
