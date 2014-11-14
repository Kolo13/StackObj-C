//
//  User.h
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/10/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject


@property NSInteger userID;
@property (strong, nonatomic) NSString* displayName;
@property (strong, nonatomic) NSString* profileImageURL;

+(NSMutableArray*) parseJSONDataIntoUserObjects:(NSData*)rawJasonData;






@end
