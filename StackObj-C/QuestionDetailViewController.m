//
//  QuestionDetailViewController.m
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/11/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import "QuestionDetailViewController.h"
#import "NetworkController.h"
#import "Question.h"

@interface QuestionDetailViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation QuestionDetailViewController



-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
  self.searchTerm = searchBar.text;
  NSString *urlWithSearchTerm;
  
  if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"authToken"] isKindOfClass:[NSString class]]) {
    NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:@"authToken"];
    urlWithSearchTerm = [NSString stringWithFormat: @"https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=%@&site=stackoverflow&access_token=%@&key=RvP0pTyTstB*mlIcy*fKEQ((", self.searchTerm, token];
  } else {
    urlWithSearchTerm = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=%@&site=stackoverflow", self.searchTerm];
    }

  
  [[NetworkController sharedManager]fetchStackData:urlWithSearchTerm completionHandler:^(NSData *rawData) {
    NSMutableArray *tempArray = [Question parseJSONDataIntoQuestionObjects:rawData];
    self.questionsArray = tempArray;
    [self.tableView reloadData];
  }];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"Question Search";
  }


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.questionsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
  
  Question *tempQuestion = self.questionsArray[indexPath.row];
  cell.textLabel.text = tempQuestion.title;
  return cell;
}

@end
