//
//  MyData.h
//  NSXMLParser
//
//  Created by Mani Batra on 28/05/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyData : NSObject<NSXMLParserDelegate>

-(BOOL)parseDocumentWithURL : (NSURL*)url;

@end
