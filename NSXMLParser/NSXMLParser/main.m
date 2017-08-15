//
//  main.m
//  NSXMLParser
//
//  Created by Mani Batra on 28/05/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyData.h"

int main(int argc, const char * argv[])
{
    
    NSURL *url=[NSURL URLWithString:@"http://www.w3schools.com/xml/simple.xml"];
    
    MyData *test=[[MyData alloc] init];
    
    if(url!=nil)
        [test parseDocumentWithURL:url];
    
   
    
    return 0;
    
}

