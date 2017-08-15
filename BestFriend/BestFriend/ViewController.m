//
//  ViewController.m
//  BestFriend
//
//  Created by Mani Batra on 18/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize name;
@synthesize photo;
@synthesize email;
@synthesize map;

-(IBAction)newBFF:(id)sender{
    
    ABPeoplePickerNavigationController *picker;
    picker=[[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate=self;
    [self presentModalViewController:picker animated:YES];
    [picker release];
    
}

-(void) peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController*) peoplePicker{
    
    [self dismissModalViewControllerAnimated:YES];
    
}

-(BOOL) peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    
    return NO;
    
}

-(BOOL) peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person{
    
    NSString* friendName;
    NSString* friendEmail;
    NSString* friendZip;
    
    friendName=(NSString*) ABRecordCopyValue(person, kABPersonFirstNameProperty);
    name.text=friendName;
    [friendName release];
    
    
    ABMultiValueRef friendAddressSet;
    NSDictionary* friendFirstAddress;
    friendAddressSet=ABRecordCopyValue(person, kABPersonAddressProperty);
    if (ABMultiValueGetCount(friendAddressSet)>0) {
        friendFirstAddress=(NSDictionary*)ABMultiValueCopyValueAtIndex(friendAddressSet, 0);
        friendZip=[friendFirstAddress objectForKey:@"ZIP"];
        [self centerMap:friendZip showAddress:friendFirstAddress];
        [friendFirstAddress release];
    }
    
    ABMultiValueRef friendEmailAddress;
    friendEmailAddress=ABRecordCopyValue(person, kABPersonEmailProperty);
    if (ABMultiValueGetCount(friendEmailAddress)>0) {
        friendEmail=(NSString*) ABMultiValueCopyValueAtIndex(friendEmailAddress, 0);
        email.text=friendEmail;
        [friendEmail release];
    }
    
    
    if (ABPersonHasImageData(person)) {
        photo.image=[UIImage imageWithData:(NSData*) ABPersonCopyImageData(person)];
    }
    
    
    [self dismissModalViewControllerAnimated:YES];
    return NO;
    
    
    
}


-(void) centerMap:(NSString*) zipCode showAddress:(NSDictionary*) fullAddress{

    NSString *queryURL;
    NSString *queryResults;
    NSArray *queryData;
    double latitude;
    double longitude;
    MKCoordinateRegion mapRegion;
    
    queryURL = [[NSString alloc] 
                initWithFormat:
                @"http://maps.google.com/maps/geo?output=csv&q=%@", 
                zipCode];
    
    queryResults = [[NSString alloc] initWithContentsOfURL:
                    [NSURL URLWithString:queryURL]
                                                  encoding: NSUTF8StringEncoding 
                                                     error: nil];
    // Autoreleased
    queryData = [queryResults componentsSeparatedByString:@","];
    
    if([queryData count]==4) {
        latitude=[[queryData objectAtIndex:2] doubleValue];
        longitude=[[queryData objectAtIndex:3] doubleValue];
        //     CLLocationCoordinate2D;
        mapRegion.center.latitude=latitude;
        mapRegion.center.longitude=longitude;
        mapRegion.span.latitudeDelta=0.2;
        mapRegion.span.longitudeDelta=0.2;
        [map setRegion:mapRegion animated:YES];
		
		if (zipAnnotation!=nil) {
			[map removeAnnotation: zipAnnotation];
		}
		zipAnnotation = [[MKPlacemark alloc] initWithCoordinate:mapRegion.center addressDictionary:fullAddress];
        [map addAnnotation:zipAnnotation];
		[zipAnnotation release];
		
		
    }
    
    [queryURL release];
    [queryResults release];

}

-(MKAnnotationView*) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    
    MKPinAnnotationView *pinDrop=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"citycenter"];
    pinDrop.animatesDrop=YES;
    pinDrop.canShowCallout=YES;
    pinDrop.pinColor=MKPinAnnotationColorPurple;
    return pinDrop;
    
}

-(IBAction)sendEmail:(id)sender{
    
    MFMailComposeViewController *mailComposer;
    NSArray *emailAddress=[[NSArray alloc] initWithObjects:email.text, nil];
    mailComposer=[[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate=self;
    [mailComposer setToRecipients:emailAddress];
    [self presentModalViewController:mailComposer animated:YES];
    [emailAddress release];
    [mailComposer release];
    
    
    
}

-(void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    [self dismissModalViewControllerAnimated:YES];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(void) dealloc{
    
    [name release];
    [email release];
    [photo release];
    [map release];
    [super dealloc];
    
}

@end
