//
//  ViewController.m
//  FlashCards
//
//  Created by Mani Batra on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController
@synthesize cardCount, wrongCount, rightCount;
@synthesize question, answer;
@synthesize deleteButton, rightButton, wrongButton, actionButton;
@synthesize flashCards;
@synthesize currentCardCounter;

-(FlashCard*) currentCard{
    
    if (self.currentCardCounter < 0) {
        return nil;
    }
    
FlashCard* flashCard=[self.flashCards objectAtIndex:currentCardCounter];

return flashCard;
    
}

-(void) showNextCard{
    
    self.rightButton.enabled=NO;
    self.wrongButton.enabled=NO;
    
    NSUInteger numberOfCards=[self.flashCards count];
    
    if (numberOfCards==0) {
        //UI state for no cards
        
        self.question.text=@"";
        self.answer.text=@"";
        self.cardCount.text=@"Add a flash card to get started";
        self.wrongCount.text=@"";
        self.rightCount.text=@"";
        self.deleteButton.enabled=NO;
        self.rightButton.enabled=NO;
    } else {
        self.currentCardCounter+=1;
        if (self.currentCardCounter >= numberOfCards) {
            //Loop back to the first card
            self.currentCardCounter=0;
        }
        
        self.cardCount.text=[[NSString alloc] initWithFormat:@"%i of %i", (self.currentCardCounter+1), numberOfCards];
        self.question.text=self.currentCard.question;
        self.answer.hidden=YES;
        self.answer.text=self.currentCard.answer;
        [self updateRightWrongCounters];
        deleteButton.enabled=YES;
        actionButton.enabled=YES;
    }
    
}


-(IBAction)markWrong:(id)sender{
    
    //Update the flash card
    
    self.currentCard.wrongCount+=1;
    if (!self.rightButton.enabled) {
        self.currentCard.rightCount-=1;
    }
    
    //Update the UI
    
    
    self.wrongButton.enabled=NO;
    self.rightButton.enabled=YES;
    [self updateRightWrongCounters];
    
}
-(IBAction)markRight:(id)sender{
    
    //Update the flash card
    
    self.currentCard.rightCount+=1;
    if (!self.wrongButton.enabled) {
        self.currentCard.wrongCount-=1;
    }
    
    //Update the UI
    
    
    self.wrongButton.enabled=YES;
    self.rightButton.enabled=NO;
    [self updateRightWrongCounters];

    
    
}
-(IBAction)nextAction:(id)sender{
    if (self.answer.hidden) {
        self.answer.hidden=NO;
        self.wrongButton.enabled=YES;
        self.rightButton.enabled=YES;
            } else {
                [self showNextCard];
                    }
    
}
-(IBAction)addCard:(id)sender{
    
    CreateCardViewControllerViewController *cardCreator=[[CreateCardViewControllerViewController alloc] init];
    
    cardCreator.cardDelegate=self;
    [self presentModalViewController:cardCreator animated:YES];
    [cardCreator release];
    
    
}
-(IBAction)deleteCard:(id)sender{
    
    [self.flashCards removeObjectAtIndex:currentCardCounter];
    [self showNextCard];
    
}

-(void) didcancelCardCreation{
    
    [self dismissModalViewControllerAnimated:YES];
    
}


-(void) didCreateCardWithQuestion:(NSString *)thisQuestion answer:(NSString *)thisAnswer{
    
    FlashCard *newCard=[[FlashCard alloc] initWithQuestion:thisQuestion answer:thisAnswer];
    
    if (self.currentCardCounter >= [self.flashCards count]) {
        [self.flashCards addObject:newCard];
            } else {
                [self.flashCards insertObject:newCard atIndex:(self.currentCardCounter+1)];
                    }
    
    [self showNextCard];
    [self dismissModalViewControllerAnimated:YES];
    
   
    
    
}


-(NSString*) archivePath{
    
    NSString* docDir=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [docDir stringByAppendingPathComponent:@"FlashCards.dat"];
    
}

-(void) archiveFlashCards{
    
    [NSKeyedArchiver archiveRootObject:flashCards toFile:[self archivePath]];
    
}

- (void)viewDidLoad
{
    self.flashCards=[NSKeyedUnarchiver unarchiveObjectWithFile:[self archivePath]];
    self.currentCardCounter=-1;
    if (self.flashCards==nil) {
        self.flashCards=[[NSMutableArray alloc] init];
    }
    [self showNextCard];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void) updateRightWrongCounters{
    
    self.rightCount.text=[[NSString alloc] initWithFormat:@"%i", self.currentCard.rightCount];
    self.wrongCount.text=[[NSString alloc] initWithFormat:@"%i", self.currentCard.wrongCount];

    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void) dealloc{
    
    [cardCount release];
    [wrongButton release];
    [rightButton release];
    [wrongCount release];
    [rightCount release];
    [question release];
    [answer release];
    [deleteButton release];
    [actionButton release];
    [flashCards release];
    [super dealloc];
     
    
}

@end
