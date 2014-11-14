//
//  QuestionDetailViewController.h
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/11/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionDetailViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *questionsArray;
@property (nonatomic, strong) NSString *searchTerm;
@property (nonatomic, strong) NSString *baseURL;


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;


@end
