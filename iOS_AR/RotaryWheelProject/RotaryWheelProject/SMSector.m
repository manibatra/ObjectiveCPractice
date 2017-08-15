//
//  SMSector.m
//  RotaryWheelProject
//
//  Created by Mani Batra on 26/11/12.
//  Copyright (c) 2012 Mani Batra. All rights reserved.
//

#import "SMSector.h"

@implementation SMSector
@synthesize minValue, midValue, maxValue, sector;

-(NSString*) description{
    
    return [NSString stringWithFormat:@" %i | %f %f %f", self.sector, self.minValue, self.midValue, self.maxValue];
    
}



@end
