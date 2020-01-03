//
//  NSMutableArray+RJArray.m
//  WGLearnMTMediatorDemo
//
//  Created by jia on 2020/1/2.
//  Copyright © 2020 wanggang. All rights reserved.
//

#import "NSMutableArray+RJArray.h"
#import "RJSwizzlingDefine.h"

@implementation NSMutableArray (RJArray)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cla = [[NSMutableArray array] class];
        swizzling_exchangeMethod(cla, @selector(addObject:), @selector(rj_maddObject:));
        swizzling_exchangeMethod(cla, @selector(removeObjectAtIndex:), @selector(rj_mremoveItemAtIndex:));
        swizzling_exchangeMethod(cla, @selector(objectAtIndex:), @selector(rj_mobjectAtIndex:));
    });
}

- (void)rj_mremoveItemAtIndex:(NSInteger)index {
    if (index<self.count) {
        [self rj_mremoveItemAtIndex:index];
    }
}
- (void)rj_maddObject:(id)anObject {
    if (anObject != nil) {
        [self rj_maddObject:anObject];
    }
}

- (id)rj_mobjectAtIndex:(NSInteger)index {
    if (index < self.count) {
        return [self rj_mobjectAtIndex:index];
    }
    return nil;
}
@end
