//
//  FlashCard.h
//  FlashCards
//
//  Created by Mani Batra on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlashCard : NSObject<NSCoding>{
    
    NSString *question;
    NSString *answer;
    NSUInteger rightCount;
    NSUInteger wrongCount;
    
}

@property (nonatomic, retain) NSString *question;
@property (nonatomic, retain) NSString *answer;
@property (nonatomic, assign) NSUInteger rightCount;
@property (nonatomic, assign) NSUInteger wrongCount;


-(id) initWithQuestion:(NSString*) thisQuestion 
                answer: (NSString*) thisAnswer;

@end
