//
//  main.m
//  BasicFileOperations
//
//  Created by Mani Batra on 25/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSFileHandle *inFile, *outFile;
        NSData *buffer;
        NSUInteger kBufSize=20;
        
        inFile=[NSFileHandle fileHandleForReadingAtPath: @"/Users/manibatra/unixstuff/testin"];
        
        if (inFile==nil) {
            printf("Opening file for reading failed\n\n");
            return 1;
        }
        
    //Create the output first if necessary
        [[NSFileManager defaultManager] createFileAtPath:@"/Users/manibatra/unixstuff/testout" contents:nil attributes:nil];
        
        //Now open the output file for writing
        outFile=[NSFileHandle fileHandleWithStandardOutput];
        
        
        //Truncate the output file since it may contain data
        //[outFile truncateFileAtOffset:0];
        
        int sizea=[inFile seekToEndOfFile];
        printf("%i\n",sizea);
        
        [inFile seekToFileOffset:0];
        
        //Read the file from inFile and write it to outfile
        
        buffer=[inFile readDataOfLength:kBufSize];
        [outFile writeData:buffer];
        
    
        int size=[outFile seekToEndOfFile];
        printf("\n%i",size);
        
        [inFile closeFile];
        [outFile closeFile];
        
        
        
        
    }
    return 0;
}

