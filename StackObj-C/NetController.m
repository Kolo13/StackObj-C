//
//  NetController.m
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/12/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import "NetController.h"

@interface NetController ()

@end

@implementation NetController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+ (NetworkController*)sharedManager {
  static NetworkController *sharedMyManager = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedMyManager = [[self alloc] init];
  });
  return sharedMyManager;
}





- (void)fetchQuestionData:(NSString *)searchTerm completionHandler:(void (^)(NSData* rawData))completionHandler {
  
  NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
  
  NSURLSession *urlSession = [NSURLSession sessionWithConfiguration:configuration];
  
  NSString *urlWithSearchTerm = [NSString stringWithFormat:@"https://api.stackexchange.com/2.2/search?order=desc&sort=activity&tagged=%@&site=stackoverflow", @"Stack"];
  
  NSURL *url = [[NSURL alloc] initWithString:urlWithSearchTerm];
  NSURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  
  NSURLSessionDataTask *dataTask = [urlSession dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    
    
    
    
    if (error != nil) {
      NSLog(@"%@", [error localizedDescription]);
    } else {
      if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        
        NSInteger statusCode = [httpResponse statusCode];
        
        if (statusCode >= 200 && statusCode <= 299) {
          
            //NSMutableArray *users = [User parseJSONDataIntoUserObjects:data];
            //[completionHandler(data)];
          
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
