//
//  ViewController.h
//  Test
//
//  Created by Mani Batra on 28/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController

@property(strong, nonatomic) NSMutableDictionary *postParams;
@property(strong, nonatomic) PF_Facebook *facebook;

- (IBAction)loginButtonAction:(id)sender;
- (IBAction)shareBUttonAction:(id)sender;


@end
