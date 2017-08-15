//
//  HUDLayer.mm
//  First@Cocos2D
//
//  Created by Mani Batra on 29/01/13.
//
//

#import "HUDLayer.h"
#import "HelloWorldLayer.h"

@implementation HUDLayer

int counter=0;

-(id)init {

    if (self=[super init]) {
        
        _counterLabel=[CCLabelTTF labelWithString:[NSString stringWithFormat:@"Explosions : %d", counter] fontName:@"Marker Felt" fontSize:24];
        
        CGSize size=[[CCDirector sharedDirector] winSize];
        
        _counterLabel.position=ccp(size.width * 0.85, size.height *0.9);
        
        [self addChild:_counterLabel z:10];
        
    }
    
    return self;
    
}


-(void) incrementCounter{
    
    
    counter++;
    _counterLabel.string=[NSString stringWithFormat:@"Explosions : %d", counter];
    
    
}

@end
