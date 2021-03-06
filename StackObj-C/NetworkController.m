//
//  NetworkController.m
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/11/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import "NetworkController.h"
#import "User.h"

@interface  NetworkController()

@property (nonatomic, strong) NSURLSession *URLSession;

@end

@implementation NetworkController





+ (NetworkController*)sharedManager {
  static NetworkController *sharedMyManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedMyManager = [[self alloc] init];
  });
  return sharedMyManager;
}


- (void)fetchStackData:(NSString *)searchTerm completionHandler:(void (^)(NSData* rawData))completionHandler {
  NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
  self.URLSession = [NSURLSession sessionWithConfiguration:configuration];
  NSURL *url = [[NSURL alloc] initWithString:searchTerm];
  NSURLSessionDataTask *dataTask = [self.URLSession dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {

  if (error != nil) {
      NSLog(@"%@", [error localizedDescription]);
    } else {
      if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        
        NSInteger statusCode = [httpResponse statusCode];
        
        if (statusCode >= 200 && statusCode <= 299) {
          
          [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            completionHandler(data);
          }];
        } else if (statusCode >= 400 && statusCode <= 499) {
          NSLog(@"Error! Status code is: %lu", statusCode);
          NSLog(@"This is the clients fault");
        } else if (statusCode >= 500 && statusCode <= 599) {
          NSLog(@"Error! Status code is: %lu", statusCode);
          NSLog(@"This is the server's fault");
        } else {
          NSLog(@"Error! Status code is: %lu", statusCode);
          NSLog(@"Bad Response");
        }
      }
    }
  }];
  [dataTask resume];
}


@end
