//
//  main.m
//  FindUtility
//
//  Created by Mani Batra on 29/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSFileManager *NSFm;
        NSString *start,*path, *file;
        NSProcessInfo *proc=[NSProcessInfo processInfo];
        NSArray *args=[proc arguments];
        NSDirectoryEnumerator *dirEnum;
        
        //Making sure that the usage is correct
        if ([args count]!=4) {
            printf("Usage : find startDirectory filename\n\n");
            return 1;
        }
        
        NSFm=[NSFileManager defaultManager];

        //Setting the start directory and the filename
        start=[args objectAtIndex : 2];
        path=[args objectAtIndex : 2];
        file=[args objectAtIndex:3];
        
        
        
        dirEnum=[NSFm enumeratorAtPath:path];
        
        while ((path=[dirEnum nextObject])!=0 ) {

            if ( [[path lastPathComponent] isEqualToString:file]) {
                break;
            }
            
        }
        
        
        
        if ([[path lastPathComponent] isEqualToString:file]) {
            printf("%s/%s\n",[start cStringUsingEncoding:NSASCIIStringEncoding],[path cStringUsingEncoding : NSASCIIStringEncoding]);

        }
        else {
            printf("The file could not be found\n\n");
        }
        
       
        
        
    }
    return 0;
}

