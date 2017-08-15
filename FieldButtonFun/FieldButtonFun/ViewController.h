//
//  ViewController.h
//  FieldButtonFun
//
//  Created by Mani Batra on 09/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    IBOutlet UITextField *thePlace;
    IBOutlet UITextField *theVerb;
    IBOutlet UITextField *theNumber;
    IBOutlet UITextView *theTemplate;
    IBOutlet UITextView *theStory;
    IBOutlet UIButton *generateStory;


    
}


@property (nonatomic, retain) UITextField *thePlace;
@property (nonatomic, retain) UITextField *theVerb;
@property (nonatomic, retain) UITextField *theNumber;
@property (nonatomic, retain) UITextView *theTemplate;
@property (nonatomic, retain) UITextView *theStory;
@property (nonatomic, retain) UIButton *generateStory;

-(IBAction)createStory:(id)sender;
-(IBAction)hideKeyboard:(id)sender;

@end
