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
        swizzling_exchangeMethod(cla, @selector(addObject:), @selector(rj_addObject:));
        swizzling_exchangeMethod(cla, @selector(removeObjectAtIndex:), @selector(rj_removeItemAtIndex:));
    });
}

- (void)rj_removeItemAtIndex:(NSInteger)index {
    if (index<self.count) {
        [self rj_removeItemAtIndex:index];
    }
}
- (void)rj_addObject:(id)anObject {
    if (anObject != nil) {
        [self rj_addObject:anObject];
    }
}

@end
