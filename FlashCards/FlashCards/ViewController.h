//
//  ViewController.h
//  FlashCards
//
//  Created by Mani Batra on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FlashCard.h"
#import "CreateCardViewControllerViewController.h"

@interface ViewController : UIViewController<CreateCardDelegate>{
    
    IBOutlet UILabel *cardCount;
    IBOutlet UILabel *wrongCount;
    IBOutlet UILabel *rightCount;
    IBOutlet UILabel *question;
    IBOutlet UILabel *answer;
    IBOutlet UIBarButtonItem *deleteButton;
    IBOutlet UIBarButtonItem *rightButton;
    IBOutlet UIBarButtonItem *wrongButton;
    IBOutlet UIBarButtonItem *actionButton;
    NSMutableArray *flashCards;
    NSUInteger currentCardCounter;
    FlashCard *currentCard;
    
}
@property (nonatomic, retain)  UILabel *cardCount;
@property (nonatomic, retain) UILabel *wrongCount;
@property (nonatomic, retain) UILabel *rightCount;
@property (nonatomic, retain) UILabel *question;
@property (nonatomic, retain) UILabel *answer;
@property (nonatomic, retain) UIBarButtonItem *deleteButton;
@property (nonatomic, retain)  UIBarButtonItem *rightButton;
@property (nonatomic, retain) UIBarButtonItem *wrongButton;
@property (nonatomic, retain) UIBarButtonItem *actionButton;
@property (nonatomic, retain) NSMutableArray *flashCards;
@property (nonatomic, assign) NSUInteger currentCardCounter;
@property (nonatomic, readonly) FlashCard *currentCard;

-(IBAction)markWrong:(id)sender;
-(IBAction)markRight:(id)sender;
-(IBAction)nextAction:(id)sender;
-(IBAction)addCard:(id)sender;
-(IBAction)deleteCard:(id)sender;

-(void) showNextCard;
-(void) updateRightWrongCounters;
-(void) archiveFlashCards;



@end
