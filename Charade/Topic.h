//
//  Topic.h
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Topic : NSObject

@property (nonatomic, copy, readonly) NSString *name,*desc;
@property (nonatomic, copy, readonly) NSMutableArray *questions;
@property (nonatomic, readonly) int xid,catId;


- (instancetype)initWithName:(NSString*)name desc:(NSString*)desc questions:(NSMutableArray*)questions id:(int)xid catId:(int)catId;

@end
