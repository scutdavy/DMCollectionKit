//
//  TestArray.m
//  CollectionKit
//
//  Created by 邢大为 on 13-3-31星期日.
//  Copyright (c) 2013年 domi network. All rights reserved.
//

#import "TestArray.h"
#import "NSArray+DMCollectionKit.h"

@implementation TestArray
- (NSArray *) sourceArray{
    return @[@1, @2, @3];
}

- (void) testMap{
    NSArray *mapped = [[self sourceArray] map:^id(id obj) {
        return @( [obj integerValue] + 1 );
    }];
    NSArray *expected = @[@2, @3, @4];
    
    STAssertEqualObjects(mapped, expected, nil);
}

- (void) testSelect{
    NSArray *selected = [[self sourceArray] select:^BOOL(id obj) {
        return [obj integerValue] % 2 == 1;
    }];
    NSArray *expected = @[@1, @3];
    STAssertEqualObjects(selected, expected, nil);
}

- (void) testReject{
    NSArray *rejected = [[self sourceArray] reject:^BOOL(id obj) {
        return [obj integerValue] % 2 == 0;
    }];
    NSArray *expected = @[@1, @3];
    STAssertEqualObjects(rejected, expected, nil);
    
}

- (void) testIsEmpty{
    STAssertTrue(![[self sourceArray] isEmpty], nil);
    NSArray *emptyArray = @[];
    STAssertTrue([emptyArray isEmpty], nil);
}

- (void) testReduce{
    NSNumber *sum = [[self sourceArray] reduce:@0 withBlock:^id(id sum, id obj) {
        return @( [sum integerValue] + [obj integerValue] );
    }];
    
    STAssertEqualObjects(sum, @6, nil);
}

- (void) testObjectMatch{
    NSNumber *matched = [[self sourceArray] objectMatching:^BOOL(id obj) {
        return [obj integerValue] % 2 == 0;
    }];
    STAssertEqualObjects(matched, @2, nil);

}

- (void) testIndexMatch{
    
    NSUInteger index = [[self sourceArray] indexOfObjectMatching:^BOOL(id obj) {
        return [obj integerValue] % 2 == 0;
    }];
    
    STAssertTrue(index == 1, nil);

}

- (void) testCountMatch{
    NSUInteger count = [[self sourceArray] countOfObjectMatching:^BOOL(id obj) {
        return [obj integerValue] % 2 == 0;
    }];
    STAssertTrue(count == 1, nil);
}

@end
