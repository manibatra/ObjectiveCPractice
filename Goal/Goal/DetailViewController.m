//
//  DetailViewController.m
//  Goal
//
//  Created by Mani Batra on 03/02/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "DetailViewController.h"
#import "AppDelegate.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"aim"] description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)finish:(id)sender {
    
    AppDelegate *delegate=[[UIApplication sharedApplication]delegate];
    
    NSManagedObjectContext *context=[delegate managedObjectContext];
    
    NSManagedObject *finishedTask=(NSManagedObject*)_detailItem;
    
    [context deleteObject:finishedTask];
    
    NSError *error=nil;
    
    if (![context save:&error]) {
        
        NSLog(@"WTF did just happened");
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
