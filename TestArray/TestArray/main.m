//
//  main.m
//  TestArray
//
//  Created by Mani Batra on 03/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc] init];
    NSMutableString *str=[NSMutableString stringWithString:@"1"];
    NSMutableString *str2=[NSMutableString stringWithString:@"2"];
    NSMutableArray *myArr=[NSMutableArray arrayWithObject:str];
    
    printf("retain count for str : %lx   str2 : %lx\n",[str retainCount],[str2 retainCount]);
    
    [myArr replaceObjectAtIndex:0 withObject:str2];
    
    printf("retain count for str : %lx   str2 : %lx\n",[str retainCount],[str2 retainCount]);

    
}

