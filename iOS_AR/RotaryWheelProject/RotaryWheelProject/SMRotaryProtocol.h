//
//  SMRotaryProtocol.h
//  RotaryWheelProject
//
//  Created by Mani Batra on 25/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SMRotaryProtocol <NSObject>

-(void) wheelDidChangeValue:(NSString*)newValue;

@end
