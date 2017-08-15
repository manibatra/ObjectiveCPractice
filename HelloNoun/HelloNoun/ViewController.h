//
//  ViewController.h
//  HelloNoun
//
//  Created by Mani Batra on 09/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UILabel *userOutput;
    IBOutlet UITextField *userInput;
    
    
}

-(IBAction)setOutput:(id)sender;
@property(nonatomic, retain) UILabel *userOutput;
@property(nonatomic, retain) UITextField *userInput;

@end
