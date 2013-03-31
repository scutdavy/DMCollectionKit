//
//  NSArray+DMCollectionKit.h
//  CollectionKit
//
//  Created by 邢大为 on 13-3-31星期日.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^DMTransformBlock)(id obj);
typedef BOOL (^DMValidationBlock)(id obj);
typedef id (^DMAccumulationBlock)(id sum, id obj);


@interface NSArray (DMCollectionKit)

- (BOOL)isEmpty;

- (NSArray *)map:(DMTransformBlock)block;

- (NSArray *)select:(DMValidationBlock)block;

- (NSArray *)reject:(DMValidationBlock)block;

- (id)reduce:(id)initial withBlock:(DMAccumulationBlock)block;

- (id)objectMatching:(DMValidationBlock)block;

- (NSUInteger)indexOfObjectMatching:(DMValidationBlock) block;

- (NSUInteger)countOfObjectMatching:(DMValidationBlock) block;

@end
