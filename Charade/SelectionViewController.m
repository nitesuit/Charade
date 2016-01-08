//
//  SelectionViewController.m
//  Charade
//
//  Created by Povilas Staskus on 1/8/16.
//  Copyright © 2016 ItWorksMobile. All rights reserved.
//

#import "SelectionViewController.h"

@interface SelectionViewController ()
@property NSMutableArray *groups;
@property NSMutableArray *topics;
@property NSMutableArray *selectedTopics;
@property bool isGroupSelected;
@property NSInteger selectedGroupIndex;
@end

@implementation SelectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isGroupSelected = NO;
    id<DBHelper> db = [JSONHelper sharedHelper];
    _groups = [db groups];
    _topics = [db topics];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *groupId = @"groupcell";
    static NSString *topicId = @"topiccell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:groupId];
    
    if ([tableView isEqual:_groupTableView]) {
        
      
        cell = [tableView dequeueReusableCellWithIdentifier:groupId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:groupId];
        }
              cell.textLabel.text = [_groups[indexPath.row] name];

    }
    
    if ([tableView isEqual:_topicTableView]) {
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:topicId];
        }
        if (!_isGroupSelected) {
            cell.textLabel.text = [_topics[indexPath.row] name];
        }
        else {
            
                cell.textLabel.text = [_selectedTopics[indexPath.row] name];
            
        }
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([tableView isEqual:_groupTableView]) {
        _isGroupSelected = YES;
        _selectedGroupIndex = indexPath.row;
        _selectedTopics = [[NSMutableArray alloc]init];
        for (int i=0;i<_topics.count;i++) {
            if ([_topics[i]catId]==[_groups[_selectedGroupIndex]xid]) {
                [_selectedTopics addObject:_topics[i]];
            }
        }
        [_topicTableView reloadData];
    }
    
    if ([tableView isEqual:_topicTableView]) {
        [self performSegueWithIdentifier:@"ShowGameFromSelection" sender:nil];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    }
    

    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([tableView isEqual:_groupTableView]) {
        return _groups.count;
    }
    
    if ([tableView isEqual:_topicTableView]) {
        if (!_isGroupSelected) return _topics.count;
        return _selectedTopics.count;
        
    }

    return 0;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {

    if ([tableView isEqual:_groupTableView]) {
        cell.backgroundColor = [_groupTableView backgroundColor];
    }
    
    if ([tableView isEqual:_topicTableView]) {
        cell.backgroundColor = [_topicTableView backgroundColor];
        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowGameFromSelection"]) {
        NSIndexPath *indexPath = [_topicTableView indexPathForSelectedRow];
        GameViewController *destViewController = segue.destinationViewController;
        if (_isGroupSelected) destViewController.topic = [_selectedTopics objectAtIndex:indexPath.row];
        if (!_isGroupSelected) destViewController.topic = [_topics objectAtIndex:indexPath.row];

    }
}


@end
