//
//  DAXMLParser.m
//  DAxmlParse
//
//  Created by caowenhui on 2017/11/1.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import "DAXMLParser.h"


@interface DAXMLParser () <NSXMLParserDelegate>

// 解析器对象
@property (nonatomic,strong) NSXMLParser *parser;

@property (nonatomic, strong) DAXMLObject *currentNode;

@property (nonatomic, strong) NSMutableArray<DAXMLObject *> *nodes;

@end

@implementation DAXMLParser

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.nodes = [NSMutableArray array];
    }
    return self;
}

- (NSArray<DAXMLObject *> *)xmlObjects {
    return _nodes;
}

- (void)parseXML:(NSData *)xmlData {
    self.parser = [[NSXMLParser alloc] initWithData:xmlData];
    self.parser.delegate = self;
    
    //解析
    [self.parser parse];
    
}

- (NSError *)parserError {
    return self.parser.parserError;
}

#pragma mark - NSXMLParserDelegate
// 文档开始

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    
    self.currentNode = nil;
}

// 文档结束

- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    self.currentNode = nil;
}

// 元素开始

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"elementName=%@, namespaceURI=%@, qName=%@, attributeDict=%@",elementName,namespaceURI,qName,attributeDict);
    
//    Class componentClass = self.componentsMap[elementName];
//    DAComponent *component = [[componentClass alloc] initWithRef:elementName attributes:attributeDict];
    DAXMLObject *node = [[DAXMLObject alloc] init];
    node.name = elementName;
    node.attributes = attributeDict;
    if (self.currentNode) {
        node.parent = self.currentNode;
        [self.currentNode.subElements addObject:node];
    }
    self.currentNode = node;
    
    [self.nodes addObject:node];
}

// 元素结束

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName

{
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"elementName=%@, namespaceURI=%@,qName=%@",elementName,namespaceURI,qName);
    self.currentNode = self.currentNode.parent;
    
}

// 解析文本,会多次解析，每次只解析1000个字符，如果多于1000个就会多次进入这个方法

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
//    NSLog(@"%s",__FUNCTION__);
//    NSLog(@"string=%@",string);
//如果是空格和换行则忽略
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] > 0) {
        self.currentNode.text = string;
    }
}

- (void)dealloc {
//    NSLog(@"%s",__FUNCTION__);
}


@end
