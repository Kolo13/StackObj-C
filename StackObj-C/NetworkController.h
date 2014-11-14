//
//  NetworkController.h
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/11/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkController : NSObject
@property (nonatomic, strong) NSString *token;


@property (strong, nonatomic) NSString* downloadURL;
@property (nonatomic, strong) NSOperationQueue *operationQueue;

+ (NetworkController*)sharedManager;
- (void)fetchStackData:(NSString *)searchTerm completionHandler:(void (^)(NSData* rawData))completionHandler;

@end
