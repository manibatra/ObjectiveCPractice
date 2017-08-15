//
//  DetailViewController.m
//  Fovissste
//
//  Created by Mani Batra on 07/12/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
//- (void)configureView;
@end

@implementation DetailViewController
@synthesize detailURL,detailWebView, infoLabel, infoString;

#pragma mark - Managing the detail item




- (void)viewDidLoad
{
    infoLabel.hidden=YES;
    [detailWebView loadRequest:[NSURLRequest requestWithURL:detailURL]];
    [infoLabel setText:infoString];
    UIBarButtonItem *info=[[UIBarButtonItem alloc] initWithTitle:@"Info" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    self.navigationItem.rightBarButtonItem=info;

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    [detailWebView loadRequest:[NSURLRequest requestWithURL:detailURL]];
    [infoLabel setText:infoString];

    
}

-(void)viewDidDisappear:(BOOL)animated{
    
    infoLabel.hidden=YES;
    [detailWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"about:blank"]]];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}

-(void)click{
    
    if (infoLabel.hidden==YES) {
        infoLabel.hidden=NO;
    }else if (infoLabel.hidden==NO){
        
        infoLabel.hidden=YES;

        
    }
    
    
}
							
@end
