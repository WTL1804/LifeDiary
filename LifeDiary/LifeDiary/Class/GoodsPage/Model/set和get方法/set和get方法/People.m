//
//  People.m
//  set和get方法
//
//  Created by 王天亮 on 2020/1/26.
//  Copyright © 2020 王天亮. All rights reserved.
//

#import "People.h"

@implementation People
- (id)init {
    if(self = [super init]) {
        _firstName = @"";
        _lastName = @"";
    }
    return self;
}
- (void)setLastName:(NSString *)lastName{
    _lastName = lastName;
}
@end
