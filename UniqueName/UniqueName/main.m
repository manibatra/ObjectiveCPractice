//
//  main.m
//  UniqueName
//
//  Created by Mani Batra on 29/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *fileName;
        NSProcessInfo *proc=[NSProcessInfo processInfo];
        fileName=[proc globallyUniqueString];
        NSLog(@"%@", [fileName stringByPaddingToLength:20 withString:@"" startingAtIndex:0]);        
    }
    return 0;
}

