//
//  SMViewController.m
//  RotaryWheelProject
//
//  Created by Mani Batra on 25/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "SMViewController.h"
#import "SMRotaryWheel.h"

@interface SMViewController ()

@end

@implementation SMViewController

- (void)viewDidLoad {
    // 1 - Call super method
    [super viewDidLoad];
    // 2 - Set up rotary wheel
    SMRotaryWheel *wheel = [[SMRotaryWheel alloc] initWithFrame:CGRectMake(0, 0, 200, 200)
                                                    andDelegate:self
                                                   withSections:2];
    
    wheel.center=CGPointMake(160, 240);
    // 3 - Add wheel to view
    [self.view addSubview:wheel];
}

-(void)wheelDidChangeValue:(NSString *)newValue{
    
    self.sectorLabel.text=newValue;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
