//
//  main.m
//  RefrenceCount
//
//  Created by Mani Batra on 30/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
    NSString *mystr=@"Constant string";
    NSString *mystr2=[NSString stringWithString:@"string 2"];
    NSMutableString *mystr3=[NSMutableString stringWithString:@"string 3"];
    NSMutableArray *myarr=[NSMutableArray array];
    
    printf("Retain count : mystr: %x  , mystr2: %x,  mystr3: %x\n", [mystr retainCount], [mystr2 retainCount], [mystr3 retainCount]);

                           
    [myarr addObject:mystr];   
    [myarr addObject:mystr2];   
    [myarr addObject:mystr3];   

    printf("Retain count : mystr: %x  , mystr2: %x,  mystr3: %x\n", [mystr retainCount], [mystr2 retainCount], [mystr3 retainCount]);

    [mystr retain];
    [mystr2 retain];
    [mystr3 retain];
    
    printf("Retain count : mystr: %x  , mystr2: %x,  mystr3: %x\n", [mystr retainCount], [mystr2 retainCount], [mystr3 retainCount]);

    [mystr3 release];
    [mystr3 release];

    
    [pool release];

    
    return 0;
}

