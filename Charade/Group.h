//
//  Group.h
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Group : NSObject

@property (nonatomic, readonly) int xid;
@property (nonatomic,readonly,copy) NSString* name;

- (instancetype)initWithName:(NSString*)name id:(int)xid;

@end
