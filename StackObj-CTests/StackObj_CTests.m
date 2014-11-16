//
//  StackObj_CTests.m
//  StackObj-CTests
//
//  Created by Kori Kolodziejczak on 11/10/14.
//  Copyright (c) 2014 Kori Kolodziejczak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Question.h"

@interface StackObj_CTests : XCTestCase

@end

@implementation StackObj_CTests

- (void)testJSONIfArray {
  NSBundle *bundle = [NSBundle bundleForClass:[self class]];
  NSString *pathWay = [bundle pathForResource:@"document" ofType:@"json"];
  NSData *data = [NSData dataWithContentsOfFile:pathWay];
  NSMutableArray *tempArray = [Question parseJSONDataIntoQuestionObjects:(data)];
  XCTAssert([tempArray isKindOfClass: [NSMutableArray class]]);
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
