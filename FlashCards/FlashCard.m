//
//  FlashCard.m
//  FlashCards
//
//  Created by Mani Batra on 16/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#define kQuestion @"Question"
#define kAnswer @"Answer"
#define kRightCount @"RightCount"
#define kWrongCount @"WrongCount"

#import "FlashCard.h"

@implementation FlashCard

@synthesize question, answer, rightCount, wrongCount;

-(id) initWithQuestion:(NSString*) thisQuestion 
                answer: (NSString*) thisAnswer{
    
    if (self=[super init]) {
        self.question=thisQuestion;
        self.answer=thisAnswer;
        self.rightCount=0;
        self.wrongCount=0;
            } 

    return self;

    
}

-(void) encodeWithCoder:(NSCoder *)aCoder{
    
    [aCoder encodeObject:self.question forKey:kQuestion];
    [aCoder encodeObject:self.answer forKey:kAnswer];
    [aCoder encodeInt:self.rightCount forKey:kRightCount];
    [aCoder encodeInt:self.wrongCount forKey:kWrongCount];



    
}


-(id) initWithCoder:(NSCoder *)aDecoder{
    
    if (self=[super init]) {
        self.question=[aDecoder decodeObjectForKey:kQuestion];
        self.answer=[aDecoder decodeObjectForKey:kAnswer];
        self.rightCount=[aDecoder decodeIntForKey:kRightCount];
        self.wrongCount=[aDecoder decodeIntForKey:kWrongCount];
    }
    
    return self;
}


@end
