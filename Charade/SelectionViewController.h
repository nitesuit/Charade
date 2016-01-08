//
//  SelectionViewController.h
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONHelper.h"
#import "GameViewController.h"

@interface SelectionViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *groupTableView;
@property (strong, nonatomic) IBOutlet UITableView *topicTableView;

@end
