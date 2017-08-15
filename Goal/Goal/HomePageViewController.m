//
//  HomePageViewController.m
//  Goal
//
//  Created by Mani Batra on 16/02/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "HomePageViewController.h"
#import "MasterViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:@"showGoal"]){
        

        [[segue destinationViewController] setEntityName:@"Goals"];
        
    }else if([[segue identifier] isEqualToString:@"showPriority"]){
        
        
        [[segue destinationViewController] setEntityName:@"Priorities"];
        
        
    }else if([[segue identifier] isEqualToString:@"showBucketList"]){
        
        
        [[segue destinationViewController] setEntityName:@"BucketList"];
        
        
    }
}


@end
