//
//  AddGoalsViewController.m
//  Goal
//
//  Created by Mani Batra on 17/02/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "AddGoalsViewController.h"
#import "AppDelegate.h"

@interface AddGoalsViewController ()

@end

@implementation AddGoalsViewController
@synthesize goal, number, unit, note;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Saving the new goal to the database
- (IBAction)saveGoal:(id)sender {
    
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext *context=[delegate managedObjectContext];
    
    
    NSManagedObject *newGoal=[NSEntityDescription insertNewObjectForEntityForName:@"Goals" inManagedObjectContext:context];
    
    //Used for converting NSString from the number text field to NSNumber
    NSNumberFormatter *f=[[NSNumberFormatter alloc]init];
    
    
    //Setting the values of the object
    [newGoal setValue:[goal text] forKey:@"aim"];
    [newGoal setValue:[f numberFromString:[number text]] forKey:@"goalNumber"];
    [newGoal setValue:[unit text] forKey:@"unit"];
    [newGoal setValue:[note text] forKey:@"note"];
    [newGoal setValue:[NSDate date] forKey:@"timeStamp"];
    
    
    //Saving the object
    NSError *error=nil;
    if (![context save:&error]) {
        
        //To be replaced when shipping
        NSLog(@"Unresolved error");
        abort();
        
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}


//Makes the keyboard go away when the background is tapped
- (IBAction)hideKeyBoard:(id)sender {
    
    [goal resignFirstResponder];
    [number resignFirstResponder];
    [unit resignFirstResponder];
    [note resignFirstResponder];
    
}


@end
