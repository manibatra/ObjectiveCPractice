//
//  main.m
//  CopyUtility
//
//  Created by Mani Batra on 25/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSFileManager *NSFm;
        NSString *source, *dest;
        BOOL isDir;
        NSProcessInfo *proc=[NSProcessInfo processInfo];
        NSArray *args=[proc arguments];
        
        NSFm=[NSFileManager defaultManager];
        
        
        //Check for two arguments in the command line
        if ([args count]<4 || [args count]>6) {
            printf("Usage : %s src dest\n\n",[[proc processName] cStringUsingEncoding:NSASCIIStringEncoding]);
            return 1;
        }
        
        
        
        
        
        
        //Make sure the source file can be read
        
        for (int i=2; i<([args count]-1); i++) {
            
            source=[args objectAtIndex:i];
            dest=[args objectAtIndex:[args count]-1];


        
        
        if ([NSFm isReadableFileAtPath:source]==NO) {
            printf("Cant read %s\n\n", [source cStringUsingEncoding:NSASCIIStringEncoding]);
            return 2;
        }
        
        
        
        //See if the dest file is a directory.
        //If it is, add source to d end of the destination.
                
        [NSFm fileExistsAtPath:dest isDirectory:&isDir];
        
        if (isDir==YES) {
            dest=[dest stringByAppendingPathComponent:[source lastPathComponent]];
        }
        else {
            printf("The destination is not an existing directory\n\n");
            return 3;
        }
        
        
        //Remove the destination file if it already exists
        
        [NSFm removeItemAtPath:dest error:nil];
        
        
        //Perform copy
        
        if ([NSFm copyItemAtPath:source toPath:dest error:nil]==NO) {
            printf("Copy failed\n\n");
        }
        
        printf("Copy of %s to %s was successful\n\n", [source cStringUsingEncoding:NSASCIIStringEncoding],[dest cStringUsingEncoding:NSASCIIStringEncoding]);
                
        }          
        
    }
    return 0;
}

