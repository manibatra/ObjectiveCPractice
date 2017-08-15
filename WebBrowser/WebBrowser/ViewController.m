//
//  ViewController.m
//  WebBrowser
//
//  Created by Mani Batra on 10/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize site;
@synthesize favourites;
@synthesize address;

-(IBAction)goFwd:(id)sender{
    
    [site goForward];
    
}

-(IBAction)goBck:(id)sender{
    
    [site goBack];
    
}
-(IBAction)showFav:(id)sender{
    
    favourites.hidden=!(favourites.hidden);
    
}
-(IBAction)goTo:(id)sender{
    
    [self hideKeyboard:nil];
    
    NSString *websiteURLString;
    NSURL *webSiteURL;
    
    if (favourites.hidden==YES) {
        
        websiteURLString=[[NSString alloc] initWithString:address.text];
                
        webSiteURL=[[NSURL alloc] initWithString:websiteURLString];
        [site loadRequest:[NSURLRequest requestWithURL:webSiteURL]];
    }
    else {
        if (favourites.selectedSegmentIndex==0) {
            websiteURLString=[[NSString alloc] initWithString:@"http://www.facebook.com"];
            webSiteURL=[[NSURL alloc] initWithString:websiteURLString];
            [site loadRequest:[NSURLRequest requestWithURL:webSiteURL]];
            favourites.hidden=YES;

                } else if(favourites.selectedSegmentIndex==1) {
                    websiteURLString=[[NSString alloc] initWithString:@"http://www.watchseries.eu"];
                    webSiteURL=[[NSURL alloc] initWithString:websiteURLString];
                    [site loadRequest:[NSURLRequest requestWithURL:webSiteURL]];
                    favourites.hidden=YES;

                        }
    }
    
    
}

-(IBAction)hideKeyboard:(id)sender{
    
    [address resignFirstResponder];
    [site resignFirstResponder];
    
}


- (void)viewDidLoad

{

    favourites.backgroundColor=[UIColor clearColor];
    favourites.hidden=YES;
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

@end
