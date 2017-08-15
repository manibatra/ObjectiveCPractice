//
//  MyData.m
//  NSXMLParser
//
//  Created by Mani Batra on 28/05/13.
//  Copyright (c) 2013 Mani Batra. All rights reserved.
//

#import "MyData.h"

@implementation MyData

-(BOOL)parseDocumentWithURL : (NSURL*)url{
    
    if(url==nil)
        return NO;
    
    NSXMLParser *xmlparser=[[NSXMLParser alloc] initWithContentsOfURL:url];
    
    //this will handle the events
    
    [xmlparser setDelegate:self];
    [xmlparser setShouldResolveExternalEntities:NO];
    
    
    BOOL ok=[xmlparser parse];
    
    if(ok==NO)
        NSLog(@"Error");
    else
        NSLog(@"Ok");
    
    return ok;
    
}

-(void)parserDidStartDocument:(NSXMLParser *)parser{
    
    NSLog(@"Started parsing the document");
    
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    
    
    NSLog(@"Ended parsing the document");
}


-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    NSLog(@"Started parsing the element : %@", elementName);
    
    if(namespaceURI!=nil)
        NSLog(@" namespaceURI : %@", namespaceURI);
    
    if (qName!=nil)
        NSLog(@"qName : %@", qName);
    
    NSEnumerator *attribbutes=[attributeDict keyEnumerator];
    NSString *key, *value;
    
    while ((key=[attribbutes nextObject])!=nil) {
        
        NSLog(@"attribute : %@ = %@", key, value);
        
    }
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    
    NSLog(@"Parsed the Element : %@", elementName);

}


-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError{
    
    
    NSLog(@"XMLParser ParseError : %@", [parseError localizedDescription]);
    
}

-(void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError{
    
    NSLog(@"XMLParser ValidationError : %@", [validationError localizedDescription]);
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    
    if([parser storedValueForKey:<#(NSString *)#>])
    NSLog(@"Content : %@", string);
    
    
}



@end
