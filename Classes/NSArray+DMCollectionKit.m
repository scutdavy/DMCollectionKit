//
//  NSArray+DMCollectionKit.m
//  CollectionKit
//
//  Created by 邢大为 on 13-3-31星期日.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import "NSArray+DMCollectionKit.h"

@implementation NSArray (DMCollectionKit)

- (BOOL)isEmpty{
    return [self count] == 0;
}

- (NSArray *)map:(DMTransformBlock)block{
    NSParameterAssert(block);
    NSMutableArray *ret = [NSMutableArray arrayWithCapacity:self.count];
    
    for (id obj in self) {
        [ret addObject:block(obj)];
    }
    
    return ret;
}

- (NSArray *)select:(DMValidationBlock)block{
    NSParameterAssert(block != nil);
	
	return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
		return block(obj);
	}]];
}

- (NSArray *)reject:(DMValidationBlock)block{
    NSParameterAssert(block != nil);
	
	return [self objectsAtIndexes:[self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
		return !block(obj);
	}]];
}

- (id)reduce:(id)initial withBlock:(DMAccumulationBlock)block {
	NSParameterAssert(block != nil);
	id result = initial;
    
    for (id obj in self) {
        result = block(result, obj);
    }
	return result;
}

- (id)objectMatching:(DMValidationBlock)block{
    NSParameterAssert(block != nil);
	NSUInteger index = [self indexOfObjectMatching:block];
    
	if (index == NSNotFound) return nil;
	
	return self[index];
}

- (NSUInteger)indexOfObjectMatching:(DMValidationBlock) block{
    return [self indexOfObjectPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }];
}

- (NSUInteger)countOfObjectMatching:(DMValidationBlock) block{
    return [[self indexesOfObjectsPassingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
        return block(obj);
    }] count];
    
}
@end
