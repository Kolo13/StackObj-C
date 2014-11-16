//
//  WebViewController.m
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/12/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import "WebViewController.h"
#import "NetworkController.h"

@interface WebViewController ()
@property (nonatomic,strong) NSString *publicKey;
@property (nonatomic,strong) NSString *oAuthDomain;
@property (nonatomic,strong) NSString *clientID;
@property (nonatomic,strong) NSString *oAuthURL;

@end

@implementation WebViewController


-(void)viewDidLoad{
  [super viewDidLoad];
  
  self.publicKey =  @"RvP0pTyTstB*mllcy*fKEQ((";
  self.oAuthDomain =  @"https://stackexchange.com/oauth/login_success";
  self.clientID =  @"3858";
  self.oAuthURL = @"https://stackexchange.com/oauth/dialog";
  

  self.webView.delegate = self;
  
  NSString *loginURL = [NSString stringWithFormat: @"%@?client_id=%@&redirect_uri=%@&scope=read_inbox", self.oAuthURL, self.clientID, self.oAuthDomain];
  
  [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:loginURL]] ];
}



-(BOOL)webView:(UIWebView *)webView
                shouldStartLoadWithRequest:(NSURLRequest *)request
                navigationType:(UIWebViewNavigationType)navigationType {
  
  
  NSString *urlString = (NSString *) request;
  NSLog(@"%@",urlString);
  
  if (request) {
    NSString *requestString = request.URL.description;
    if ([requestString containsString:@"login_success"]) {
      if ([requestString containsString:@"expires"]) {
        NSArray* components = [requestString componentsSeparatedByString:@"="];
        NSArray* tokenComponents = [components[1] componentsSeparatedByString:@"&"];
        
        [NetworkController sharedManager].token = tokenComponents[0];
         NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setValue:([NetworkController sharedManager].token) forKey:@"authToken"];
        [defaults synchronize];

      }
    }
  }
  return TRUE;
}

@end
