//
//  Question.m
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/10/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import "Question.h"

@implementation Question




- (id)initQuestion:(NSDictionary *) question{
  self = [super init];
  if (self) {
    self.title = (NSString *)question[@"title"];
      //NSLog(@"%@", self.title );

    self.link = (NSString *)question[@"link"];
  }
  return self;
}


+(NSMutableArray*) parseJSONDataIntoQuestionObjects:(NSData*)rawJasonData {
  NSMutableArray *questionsArray = [[NSMutableArray alloc] init];
  NSError *error;
  
  NSDictionary *JSONDictionary;
  NSArray *JSONArray;
  
  JSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJasonData options:NSJSONReadingMutableContainers error:&error];
  
  JSONArray = (NSArray *)JSONDictionary[@"items"];
  for (NSDictionary *items in JSONArray) {
    Question *newQuestion = [[Question alloc] initQuestion:items];
      //NSLog(@"%@", items );
    [questionsArray addObject:(newQuestion)];
  }
  
    //    user = User(user: JSONDictionary)
    //    user.bio = JSONDictionary["bio"] as? String
    //    user.hireable = JSONDictionary["hireable"] as? String
    //    user.public_repos = JSONDictionary["public_repos"] as? Int
    //    user.owned_private_repos = JSONDictionary["owned_private_repos"] as? Int
    //    userArray.append(user)
    //
  
  
  return questionsArray;
  
}

@end
