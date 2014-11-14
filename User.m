//
//  User.m
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/10/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import "User.h"


@implementation User




  //- (id)initUserID:(NSString *)userID_ displayName:(NSString *) displayName_ profileImageURL:(NSString *)profileImageURL_{
 - (id)initUser:(NSDictionary *) user{
   self = [super init];
    if (self) {
      self.displayName = user[@"display_name"];
    }
    return self;
  }









+(NSMutableArray*) parseJSONDataIntoUserObjects:(NSData*)rawJasonData {
  NSMutableArray *usersArray = [[NSMutableArray alloc] init];
  NSError *error;

  NSDictionary *JSONDictionary;
  NSArray *JSONArray;
  
  
  
  JSONDictionary = [NSJSONSerialization JSONObjectWithData:rawJasonData options:NSJSONReadingMutableContainers error:&error];
   
  
      JSONArray = (NSArray *)JSONDictionary[@"items"];
      for (NSDictionary *items in JSONArray) {
        User *newUser = [[User alloc] initUser:items];
        NSLog(@"*************************** %@!", newUser.displayName);
        [usersArray addObject:(newUser)];
        }
  
  //    user = User(user: JSONDictionary)
  //    user.bio = JSONDictionary["bio"] as? String
  //    user.hireable = JSONDictionary["hireable"] as? String
  //    user.public_repos = JSONDictionary["public_repos"] as? Int
  //    user.owned_private_repos = JSONDictionary["owned_private_repos"] as? Int
  //    userArray.append(user)
  //    
  
  
  return usersArray;

  }



//
//class func parseJSONDataIntoTweets(rawJSONData : NSData) -> [User] {
//  var error : NSError?
//  var userArray = [User]()
//  var user: User
//  
//  if let JSONDictionary = NSJSONSerialization.JSONObjectWithData(rawJSONData, options: nil, error: &error) as? NSDictionary {
//    if let JSONArray = JSONDictionary["items"] as? NSArray {
//      for item in JSONArray {
//        if let tempDictionary = item as? NSDictionary {
//          user = User(user: tempDictionary)
//          userArray.append(user)
//        }
//      }
//    }else{
//      user = User(user: JSONDictionary)
//      user.bio = JSONDictionary["bio"] as? String
//      user.hireable = JSONDictionary["hireable"] as? String
//      user.public_repos = JSONDictionary["public_repos"] as? Int
//      user.owned_private_repos = JSONDictionary["owned_private_repos"] as? Int
//      userArray.append(user)
//    }
//  }
//  return userArray
//}

@end
