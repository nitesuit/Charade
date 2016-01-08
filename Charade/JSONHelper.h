//
//  JSONHelper.h
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBHelper.h"
@interface JSONHelper : NSObject <DBHelper>

-(NSMutableArray*) groups;
-(NSMutableArray*) topics;
+ (JSONHelper*) sharedHelper;
- (instancetype)init;
@end
