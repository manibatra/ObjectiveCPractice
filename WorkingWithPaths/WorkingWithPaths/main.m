//
//  main.m
//  WorkingWithPaths
//
//  Created by Mani Batra on 25/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *fname=@"path.m";
        NSFileManager *NSFm;
        NSString *path, *tempdir, *extension, *homedir, *fullpath;
        NSString *upath=@"/Users/manibatra/progs/../ch16/./path.m";
        NSArray *components;
        int i, n;
        
        
        NSFm=[NSFileManager defaultManager];
        
        //GEt the temp working directory
        
        tempdir= NSTemporaryDirectory();
        printf("The temporary directory is %s\n\n",[tempdir cStringUsingEncoding:NSASCIIStringEncoding]);
        
        //Extract the base directory from the currentdirectory
        
        path=[NSFm currentDirectoryPath];
        printf("Base directory is %s\n\n", [[path lastPathComponent] cStringUsingEncoding : NSASCIIStringEncoding]);
        
        
        //Create a full path to the file fname in the current directory
        fullpath=[ path stringByAppendingPathComponent: fname];
        printf("Full path to %s is %s\n\n", [fname cStringUsingEncoding:NSASCIIStringEncoding], [fullpath cStringUsingEncoding:NSASCIIStringEncoding]);
        
        //Get the filename extension
        extension=[fullpath pathExtension];
        printf("Extension for %s is %s\n\n", [fullpath cStringUsingEncoding:NSASCIIStringEncoding], [extension cStringUsingEncoding:NSASCIIStringEncoding]);
        
        //Get users home directory
        homedir=NSHomeDirectory();
        printf("The home directory is %s\n\n",[homedir cStringUsingEncoding:NSASCIIStringEncoding]);
        
        //Divide a path into its components
        components=[homedir pathComponents];
        
        n=[components count];
        
        for (i=0; i<n; i++) {
            printf("  %s\n",[[components objectAtIndex:i] cStringUsingEncoding:NSASCIIStringEncoding]);
        }
        
        printf("\n");
        
        //Standardize a path
        
        printf("%s => %s\n",[upath cStringUsingEncoding:NSASCIIStringEncoding],[[upath stringByStandardizingPath] cStringUsingEncoding:NSASCIIStringEncoding]);
        
    }
    return 0;
}

