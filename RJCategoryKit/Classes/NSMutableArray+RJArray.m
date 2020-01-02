//
//  NSMutableArray+RJArray.m
//  WGLearnMTMediatorDemo
//
//  Created by jia on 2020/1/2.
//  Copyright © 2020 wanggang. All rights reserved.
//

#import "NSMutableArray+RJArray.h"
#import <objc/runtime.h>

@implementation NSMutableArray (RJArray)
+ (void)load {
    Class cla = [[[NSMutableArray alloc] init] class];
    Method originAdd = class_getInstanceMethod(cla, @selector(addObject:));
    Method rjAdd = class_getInstanceMethod(cla, @selector(rj_addObject:));
    method_exchangeImplementations(originAdd, rjAdd);
}

- (void)rj_addObject:(id)anObject {
    if (anObject != nil) {
        [self rj_addObject:anObject];
    }
}

@end
