//
//  DAXMLParser.h
//  DAxmlParse
//
//  Created by caowenhui on 2017/11/1.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAXMLObject.h"


/**
 XML解析类
 */
@interface DAXMLParser : NSObject

//- (void)parseXML:(NSData *)xmlData completion:(DAXMLParseCompletionBlock)completionBlock;
- (void)parseXML:(NSData *)xmlData;
//解析出错时会返回错误信息
@property (readonly, copy) NSError *parserError;
//解析完成时会得到解析结果
@property (nonatomic, strong, readonly) NSArray<DAXMLObject *> *xmlObjects;

@end
