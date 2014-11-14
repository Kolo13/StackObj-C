//
//  WebViewController.h
//  StackObj-C
//
//  Created by Kori Kolodziejczak on 11/12/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h> 

@interface WebViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
