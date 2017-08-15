//
//  ViewController.m
//  CustomView
//
//  Created by Mani Batra on 23/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.rateView.notSelectedImage=[UIImage imageNamed:@"kermit_empty.png"];
    self.rateView.halfSelectedImage=[UIImage imageNamed:@"kermit_half.png"];
    self.rateView.fullSelectedImage=[UIImage imageNamed:@"kermit_full.png"];
    self.rateView.rating=0;
    self.rateView.editable=YES;
    self.rateView.maxRating=5;
    self.rateView.delegate=self;
    

}

-(void) rateView:(RateView *)rateView ratingDidChange:(float)rating{
    
    self.statusLabel.text=[NSString stringWithFormat:@"Rating : %f", rating];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
