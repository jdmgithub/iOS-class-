//
//  MAPViewController.m
//  MAPS
//
//  Created by Jisha Obukwelu on 5/21/14.
//  Copyright (c) 2014 Jisha Obukwelu. All rights reserved.
//
#import "MAPViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MAPAnnotation.h"

@interface MAPViewController () <CLLocationManagerDelegate, MKMapViewDelegate>

@end

@implementation MAPViewController
{
    CLLocationManager * lManager;
    MKMapView * myMapView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        lManager = [[CLLocationManager alloc] init];
        lManager.delegate = self;
        
        lManager.desiredAccuracy = kCLLocationAccuracyBest;
        lManager.distanceFilter = 100;
        
        [lManager startUpdatingLocation];
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [myMapView removeAnnotations:myMapView.annotations];
    
    for (CLLocation * location in locations) {
        
        MAPAnnotation * annotation = [[MAPAnnotation alloc] initWithCoordinate:location.coordinate];
        
        annotation.title = @"Marker";
        annotation.subtitle = @"This is a marker";
        
        [myMapView addAnnotation:annotation];
        
        //        [mapView setCenterCoordinate:location.coordinate animated:YES]; to zoom
        //        MKCoordinateRegion region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpanMake(1.0, 1.0));
        //        [mapView setRegion:region animated:YES];
        
        [myMapView selectAnnotation:annotation animated:YES];
        
        NSLog(@"%@", location);
        
        CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
        
        [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            
            for (CLPlacemark * placemark in placemarks) {
                
                NSLog (@"%@", placemark);
                
                NSString * cityState = [NSString stringWithFormat:@"%@,%@", placemark.addressDictionary[@"City"], placemark.addressDictionary[@"State"]];
                    
                    [annotation setTitle:cityState];
                    [annotation setSubtitle: placemark.country];
                
            }
        }];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //MKMapView  statements just show the default map
    myMapView = [[MKMapView alloc] initWithFrame:self.view.frame];
    
    myMapView.delegate = self; // should be created added only after mapView is created
    [self.view addSubview:myMapView];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    for (UITouch * touch in touches)
    {
        CGPoint location = [touch locationInView:myMapView];
        
        
        CLLocationCoordinate2D coordinate = [myMapView convertPoint:location toCoordinateFromView:myMapView];
        
        [myMapView setCenterCoordinate:coordinate animated:YES];
        
        
        MAPAnnotation * annotation = [[MAPAnnotation alloc] initWithCoordinate: coordinate];
        
        
        [myMapView addAnnotation:annotation];
        
        
        CLGeocoder * geoCoder = [[CLGeocoder alloc]init];
        
        CLLocation * newLocation = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
        
        
        [geoCoder reverseGeocodeLocation: newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
            
            NSLog(@"%@",placemarks);
            
            for (CLPlacemark * placemark in placemarks)
            {
                NSLog(@"%@",placemark);
                
                NSLog(@"%@",placemark.country);
                
                NSString * cityState = [NSString stringWithFormat:@"%@, %@", placemark.addressDictionary[@"City"], placemark.addressDictionary[@"State"]];
                
                [annotation setTitle:cityState];
                [annotation setSubtitle:placemark.country];
            }
        }];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    MKAnnotationView * annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotationView"];
    
    if(annotationView == nil)
    {
        annotationView = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:@"annoationView"];
        
    } else {
        
        annotationView.annotation = annotation;
    }
    annotationView.draggable = YES;
    annotationView.canShowCallout = YES;
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{ view.canShowCallout = YES; }

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState
{
    NSLog(@"new state : %d and old state : %d", (int)newState, (int)oldState);
    
    switch ((int)newState) {
    case 0://not dragging
        {
            [mapView setCenterCoordinate:view.annotation.coordinate animated:YES];
            CLGeocoder * geoCoder = [[CLGeocoder alloc] init];
            
            CLLocation * location = [[CLLocation alloc]initWithLatitude:view.annotation.coordinate.latitude longitude:view.annotation.coordinate.longitude];
            
            [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
                for (CLPlacemark * placemark in placemarks) {
                    NSLog (@"%@", placemark.addressDictionary);
                    
                    NSString * cityState = [NSString stringWithFormat:@"%@, %@", placemark.addressDictionary[@"City"], placemark.addressDictionary[@"State"]];
                    
                    [(MAPAnnotation *)view.annotation setTitle:cityState];
                    [(MAPAnnotation *)view.annotation setSubtitle:placemark.country];
                }}];
        }
        
        break;
        
    case 1://start dragging
            
        break;
        
    case 2://dragging
        
        break;
        
    case 4://end dragging
        
        break;
        
    default:
        break;
    }
}

- (BOOL)prefersStatusBarHidden {return YES;}


@end

//view did load
//UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(foundTap:)];
//
//tapRecognizer.numberOfTapsRequired = 1;
//
//tapRecognizer.numberOfTouchesRequired = 1;
//
//[myMapView addGestureRecognizer:tapRecognizer];

//-(void)foundTap:(UITapGestureRecognizer *)recognizer
//{
//    CGPoint point = [recognizer locationInView:myMapView];
//
//    CLLocationCoordinate2D tapPoint = [myMapView convertPoint:point toCoordinateFromView:self.view];
//
//    MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
//
//    point1.coordinate = tapPoint;
//
//    [myMapView addAnnotation:point1];
//}































