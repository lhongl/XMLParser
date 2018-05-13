//
//  DAXMLObject.m
//  DAxmlParse
//
//  Created by caowenhui on 2017/11/1.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import "DAXMLObject.h"

@implementation DAXMLObject

-(instancetype)init{
    self = [super init];
    if (self) {
        self.text = @"";
    }
    return self;
}

-(NSMutableArray*)subElements{
    if (_subElements == nil) {
        _subElements = [NSMutableArray array];
    }
    return _subElements;
}

@end
