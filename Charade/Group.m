//
//  Group.m
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import "Group.h"

@implementation Group
- (instancetype)initWithName:(NSString*)name id:(int)xid
{
    self = [super init];
    if (self) {
        _name = name;
        _xid = xid;
    }
    return self;
}
@end
