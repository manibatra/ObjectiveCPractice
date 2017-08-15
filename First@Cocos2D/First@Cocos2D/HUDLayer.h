//
//  HUDLayer.h
//  First@Cocos2D
//
//  Created by Mani Batra on 29/01/13.
//
//
#import "cocos2d.h"

@interface HUDLayer : CCLayer {
    
    CCLabelTTF *_counterLabel;
    
}

-(void) incrementCounter;



@end