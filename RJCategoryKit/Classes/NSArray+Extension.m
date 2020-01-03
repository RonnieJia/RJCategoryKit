
#import "NSArray+Extension.h"
#import "RJSwizzlingDefine.h"

@implementation NSArray (Extension)
+(void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        swizzling_exchangeMethod([[NSArray array] class], @selector(objectAtIndex:), @selector(rj_objectAtIndex:));
    });
}
- (id)rj_objectAtIndex:(NSInteger)index {
    if (index < self.count) {
        return [self rj_objectAtIndex:index];
    }
    return nil;
}

@end
