//
//  CreateCardViewControllerViewController.h
//  FlashCards
//
//  Created by Mani Batra on 17/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CreateCardDelegate <NSObject>

-(void) didcancelCardCreation;
-(void) didCreateCardWithQuestion: (NSString*)thisQuestion
                           answer: (NSString*) thisAnswer;

@end



@interface CreateCardViewControllerViewController : UIViewController{
    
    IBOutlet UITextField *question;
    IBOutlet UITextField *answer;
    id cardDelegate;
    
}

@property (nonatomic, retain) UITextField *question;
@property (nonatomic, retain) UITextField *answer;
@property (nonatomic, retain) id<CreateCardDelegate> cardDelegate; 

-(IBAction)save;
-(IBAction)cancel;

@end
