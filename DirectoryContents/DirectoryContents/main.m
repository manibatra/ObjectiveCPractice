//
//  main.m
//  DirectoryContents
//
//  Created by Mani Batra on 24/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSFileManager *NSFm;        
        NSString *path;
        NSDirectoryEnumerator *dirEnum;
        NSArray *dirArray;
        int i,n;
        
        
        
        NSFm=[NSFileManager defaultManager];
        path=[NSFm currentDirectoryPath];
        
        
        //Enumerating the path
        dirEnum=[NSFm enumeratorAtPath:path];
        
        printf("Contents of %s\n", [path cStringUsingEncoding:NSASCIIStringEncoding]);
        
        while ((path=[dirEnum nextObject])!=nil) {
            printf("%s\n",[path cStringUsingEncoding : NSASCIIStringEncoding]);
            
            
            
        }
        
        
        //Another way to enumerate a directory
        printf("\n\nContent using contentsof directory \n");

        dirArray=[NSFm contentsOfDirectoryAtPath:[NSFm currentDirectoryPath] error:nil];
        n=[dirArray count];
        
        for (i=0; i<n; i++) {
            printf("%s\n",[[dirArray objectAtIndex:i] cStringUsingEncoding: NSASCIIStringEncoding]);
        }
        
        
        
        
    }
    return 0;
}

