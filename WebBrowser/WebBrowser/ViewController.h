//
//  ViewController.h
//  WebBrowser
//
//  Created by Mani Batra on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    IBOutlet UITextField *address;
    IBOutlet UIWebView *site;
    IBOutlet UISegmentedControl *favourites;
    
}

@property (nonatomic, retain) UITextField *address;
@property (nonatomic, retain) UIWebView *site;
@property (nonatomic, retain) UISegmentedControl *favourites;

-(IBAction)goFwd:(id)sender;
-(IBAction)goBck:(id)sender;
-(IBAction)showFav:(id)sender;
-(IBAction)goTo:(id)sender;
-(IBAction)hideKeyboard:(id)sender;



@end
