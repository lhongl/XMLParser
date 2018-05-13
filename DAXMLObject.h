//
//  DAXMLObject.h
//  DAxmlParse
//
//  Created by caowenhui on 2017/11/1.
//  Copyright © 2017年 caowenhui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAXMLObject: NSObject
{
    NSMutableArray *_subElements;
}

@property (nonatomic, strong) NSString *name;//节点名称
@property (nonatomic, strong) NSString *text;//节点之间的文本
@property (nonatomic, strong) NSDictionary *attributes;//节点中的属性
@property (nonatomic, strong, readonly) NSMutableArray *subElements;//子节点
@property (nonatomic, weak) DAXMLObject *parent;//父节点

@end
