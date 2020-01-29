//
//  Wang.m
//  set和get方法
//
//  Created by 王天亮 on 2020/1/26.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "Wang.h"
#import <objc/runtime.h>
@implementation Wang

//假如firstName是后来请求到数据后才初始化。
@dynamic name;
- (void)setLastName:(NSString *)lastName {
    if (![lastName isEqualToString:@"wang"]) {
        [NSException raise:NSInvalidArgumentException format:@"lastname must be wang"];
    }
    [super setLastName:lastName];
    //self.lastName = lastName;
}

- (void)rush {
    NSLog(@"消息转发成功");
}
//用下面的方式写，IMP才能找到函数地址
//void rush(id self, SEL _cmd) {
//    NSLog(@"消息转发成功");
//}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSString *selectorString = NSStringFromSelector(sel);
    Method method = class_getInstanceMethod([self class], @selector(rush));
    if ([selectorString isEqualToString:@"rushB"]) {
//        class_addMethod(self, sel, method_getImplementation(class_getInstanceMethod([self class], @selector(rush))), method_getTypeEncoding(method));
        class_addMethod(self, sel, (IMP)rush, method_getTypeEncoding(method));
        return YES;
    }
    
    
    
    
    return NO;
    
}

@end

 



//
//- (void)setLastName:(NSString *)lastName {
//    if (![lastName isEqualToString:@"wangt"]) {
//        [NSException raise:NSInvalidArgumentException format:@"lastname must be wang"];
//    }
//    self.lastName = lastName;
//
//}
