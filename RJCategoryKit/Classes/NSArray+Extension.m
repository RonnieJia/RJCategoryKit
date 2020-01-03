
#import "NSArray+Extension.h"
#import "RJSwizzlingDefine.h"

@implementation NSArray (Extension)
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cla = NSClassFromString(@"__NSArrayI");
        swizzling_exchangeMethod(cla, @selector(objectAtIndex:), @selector(rj_objectAtIndex:));
        swizzling_exchangeMethod(NSClassFromString(@"__NSSingleObjectArrayI"), @selector(objectAtIndex:), @selector(rj_SingleObjectObjectAtIndex:));
    });
}
- (id)rj_objectAtIndex:(NSInteger)index {
    if (index < self.count) {
        return [self rj_objectAtIndex:index];
    }
    return nil;
}

- (id)rj_SingleObjectObjectAtIndex:(NSInteger)index {
    if (index < self.count) {
        return [self rj_SingleObjectObjectAtIndex:index];
    }
    return nil;
}

@end
