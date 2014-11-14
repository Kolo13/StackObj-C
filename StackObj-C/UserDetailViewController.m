//
//  UserDetailViewController.m
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/13/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import "UserDetailViewController.h"
#import "NetworkController.h"
#import "User.h"

@interface UserDetailViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation UserDetailViewController

-(void)viewDidLoad {
    [super viewDidLoad];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  
  self.searchTerm = searchBar.text;
  NSString *urlWithSearchTerm = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/users?order=desc&sort=reputation&inname=%@&site=stackoverflow", self.searchTerm];
  
  [[NetworkController sharedManager]fetchStackData:urlWithSearchTerm completionHandler:^(NSData *rawData) {
    NSMutableArray *tempArray = [User parseJSONDataIntoUserObjects:rawData];
    self.usersArray = tempArray;
    [self.tableView reloadData];
  }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.usersArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
  User *tempUser = self.usersArray[indexPath.row];
  cell.textLabel.text = tempUser.displayName;
  return cell;

}

@end



