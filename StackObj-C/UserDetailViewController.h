//
//  UserDetailViewController.h
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/13/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserDetailViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSArray *usersArray;
@property (nonatomic, strong) NSString *baseURL;
@property (nonatomic, strong) NSString *searchTerm;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar;
@end
