//
//  Topic.m
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import "Topic.h"

@implementation Topic


- (instancetype)initWithName:(NSString*)name desc:(NSString*)desc questions:(NSMutableArray*)questions id:(int)xid catId:(int)catId
{
    self = [super init];
    if (self) {
        _name = name;
        _desc = desc;
        _questions = questions;
        _xid = xid;
        _catId = catId;
    }
    return self;
}


@end
