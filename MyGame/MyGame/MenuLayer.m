//
//  MenuLayer.m
//  MyGame
//
//  Created by Mani Batra on 01/02/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MenuLayer.h"


@implementation MenuLayer

+(id)scene{
    
    CCScene *scene=[CCScene node];
    MenuLayer *layer=[MenuLayer node];
    [scene addChild:layer];
    return scene;
    
    
}

-(id) init{
    
    if (self==[super init]) {
        
        CGSize winSize=[CCDirector sharedDirector].winSize;
        
        CCLabelBMFont *label=[CCLabelBMFont labelWithString:@"Hello, Chipmunk! " fntFile:@"Arial.fnt"];
        label.position=ccp(winSize.width/2, winSize.height/2);
        [self addChild:label];
        
        
    }
    
    return self;
    
    
}


@end
