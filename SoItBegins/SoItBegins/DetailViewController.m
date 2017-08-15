//
//  DetailViewController.m
//  SoItBegins
//
//  Created by Mani Batra on 29/08/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item
@synthesize nameField = _nameField;
@synthesize addressField = _addressField;


-(void)saveData{
    
    [self.detailItem setValue:self.nameField.text forKey:@"name"];
    NSError *error;
    if (![self.detailItem.managedObjectContext save:&error]) {
        NSLog(@"Unresolved error  %@,%@", error, [error userInfo]);
        exit(-1);
    }
    
    
    
}
- (void)setDetailItem:(id)newDetailItem
{
    

    if (_detailItem != newDetailItem) {
        
       
        
        
        
        _detailItem = newDetailItem;
        
        // Update the view.
        
        [self configureView];
    
        NSLog(@"hello");
        [self saveData];
        
        self.title=[self.detailItem valueForKey:@"name"];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    

    if (self.detailItem) {

        self.nameField.text = [[(NSManagedObject*)self.detailItem valueForKey:@"name"] description];

    }
    


    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    self.nameField.text=[self.detailItem valueForKey:@"name"];

    
}

-(void)viewWillDisappear:(BOOL)animated{
    
        [super viewWillDisappear:animated];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self configureView];
    

}

- (void)viewDidUnload
{
    [self setNameField:nil];
    [self setAddressField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}
							
#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
