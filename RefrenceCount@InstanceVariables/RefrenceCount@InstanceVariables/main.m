//
//  main.m
//  RefrenceCount@InstanceVariables
//
//  Created by Mani Batra on 03/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ClassA: NSObject
{
    NSMutableString *str;
}

-(void) setStr : (NSMutableString*) s;
-(NSMutableString*) str;
-(void) dealloc;
@end


@implementation ClassA;

-(void) setStr : (NSMutableString*) s{
    
    [str autorelease];

    str=[s retain];
    
}
-(NSMutableString*) str{
    
    return str;
    
}

-(void) dealloc{
    
    printf("Foo dealloc\n\n");
    [str release];
    [super dealloc];
    
}

@end



int main(int argc, const char * argv[])
{
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
    NSMutableString *myStr=[NSMutableString stringWithString:@"A string"];
    ClassA *myA=[[ClassA alloc] init];
    
    printf("myStr retain count: %x\n", [myStr retainCount]);
    [myA autorelease];
    
    [myA setStr:myStr];
    
    printf("myStr retain count: %x\n", [myStr retainCount]);
    
    


    [pool release];
    printf("hell");
    


    
    return 0;
}

