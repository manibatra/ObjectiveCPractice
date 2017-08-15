//
//  main.m
//  AutoreleasePool
//
//  Created by Mani Batra on 03/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foo : NSObject
{
    int x;
}
@end


@implementation Foo;
@end

int main(int argc, const char * argv[])
{
    
    NSAutoreleasePool *pool=[[NSAutoreleasePool alloc]init];
    Foo *myFoo=[[Foo alloc] init];
    
    printf("myFoo retain count : %lx\n", [myFoo retainCount]);
    
    [pool release];
    
    printf("after pool release myFoo retain count : %lx\n", [myFoo retainCount]);
    
    pool=[[NSAutoreleasePool alloc]init];
    [myFoo autorelease];
    
    printf("after auto release myFoo retain count : %lx\n", [myFoo retainCount]);

    [myFoo retain];
    printf("after retain myFoo retain count : %lx\n", [myFoo retainCount]);
    
    [pool release];
    printf("after 2nd pool release myFoo retain count : %lx\n", [myFoo retainCount]);


    [myFoo release];

    
    
    


        
    

        return 0;
}

