//
//  ViewController.h
//  BestFriend
//
//  Created by Mani Batra on 18/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <CoreLocation/CoreLocation.h>
#import <MessageUI/MessageUI.h>



@interface ViewController : UIViewController<ABPeoplePickerNavigationControllerDelegate,MKMapViewDelegate,MFMailComposeViewControllerDelegate>{
    
    IBOutlet UILabel *name;
    IBOutlet UILabel *email;
    IBOutlet UIImageView *photo;
    IBOutlet MKMapView *map;
    MKPlacemark *zipAnnotation;
    
}

@property (nonatomic, retain) UILabel *name;
@property (nonatomic, retain) UILabel *email;
@property (nonatomic, retain) UIImageView *photo;
@property (nonatomic, retain) MKMapView *map;

-(IBAction)newBFF:(id)sender;
-(IBAction)sendEmail:(id)sender;


@end
