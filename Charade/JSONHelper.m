//
//  JSONHelper.m
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import "JSONHelper.h"

@interface JSONHelper()

@property NSMutableArray* groupsArray;
@property NSMutableArray* topicsArray;

@end

@implementation JSONHelper

-(NSMutableArray*) groupsIni {

    NSMutableArray* groupsArray = [[NSMutableArray alloc]init];
    NSDictionary *groupDictionary = [self jsonFileWithName:@"group"];
    
    NSDictionary *groups = [groupDictionary objectForKey:@"group"];
    for (NSDictionary* group in groups) {
        int xid=[[group objectForKey:@"id"]intValue];
        NSString* name=[group objectForKey:@"name"];
        
        Group *groupObj = [[Group alloc]initWithName:name id:xid];
        
        [groupsArray addObject:groupObj];
    }
    
    
    
    return groupsArray;
}

-(NSMutableArray*) topicsIni{

    NSMutableArray* topicsArray = [[NSMutableArray alloc]init];
    NSDictionary *topicDictionary = [self jsonFileWithName:@"topic"];
    
    NSDictionary *topics = [topicDictionary objectForKey:@"topic"];
    for (NSDictionary* topic in topics) {
        int xid=[[topic objectForKey:@"id"]intValue];
         int catId=[[topic objectForKey:@"catId"]intValue];
        NSString* name=[topic objectForKey:@"name"];
        NSString* desc=[topic objectForKey:@"desc"];
        NSMutableArray *questions = [topic objectForKey:@"questions"];

        Topic *topicObj = [[Topic alloc]initWithName:name desc:desc questions:questions id:xid catId:catId];
        
        [topicsArray addObject:topicObj];
    }
    
    
    
    return topicsArray;
}

-(NSMutableArray*) groups {

    return _groupsArray;
}
-(NSMutableArray*) topics {

    return _topicsArray;
}



-(NSDictionary*) jsonFileWithName:(NSString*)name
{
    NSError *deserializingError;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"json"];
    NSData *JSONData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:nil];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:JSONData options:0 error:&deserializingError];//
    
    if (deserializingError!=nil) {
        NSLog(@"%@",deserializingError);
    }
    return json;
    
}

+ (JSONHelper*) sharedHelper {

    static id<DBHelper> _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    
    return _sharedInstance;

}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _groupsArray = [self groupsIni];
        _topicsArray = [self topicsIni];
        
    }
    return self;
}

@end
