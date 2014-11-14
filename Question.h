//
//  Question.h
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/10/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject


@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* link;

- (id)initQuestion:(NSDictionary *) question;
+(NSMutableArray*) parseJSONDataIntoQuestionObjects:(NSData*)rawJasonData;


@end
