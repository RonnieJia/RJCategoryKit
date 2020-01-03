//

#import "NSMutableDictionary+RJSafe.h"
#import "RJSwizzlingDefine.h"

@implementation NSMutableDictionary (RJSafe)
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cla = [[NSMutableDictionary dictionary] class];
        swizzling_exchangeMethod(cla, @selector(setObject:forKey:), @selector(rj_setObject:forKey:));
    });
}
- (void)rj_setObject:(id)obj forKey:(id<NSCopying>)key {
    if ([self isKindOfClass:[NSMutableDictionary class]]) {
        if (obj && key) {
            [self rj_setObject:obj forKey:key];
        }
    }
}


@end
