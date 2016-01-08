//
//  DBHelper.h
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"
#import "Topic.h"

@protocol DBHelper <NSObject>

-(NSMutableArray*) groups;
-(NSMutableArray*) topics;
+ (id<DBHelper>) sharedHelper;
- (instancetype)init;
@end
