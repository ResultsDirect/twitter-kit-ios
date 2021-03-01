/*
 * Copyright (C) 2017 Twitter, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

#import <OCMock/OCMock.h>
#import "TWTRFixtureLoader.h"
#import <TwitterKit/TWTRNotificationCenter.h>
#import <TwitterKit/TWTRNotificationConstants.h>
#import "TWTRTestCase.h"
#import <TwitterKit/TWTRTweet.h>

@interface TWTRNotificationCenterTests : TWTRTestCase

@property (nonatomic, readonly) TWTRTweet *tweet;

@end

@implementation TWTRNotificationCenterTests

- (void)setUp
{
    [super setUp];
    _tweet = [TWTRFixtureLoader obamaTweet];
}

- (void)testNotificationWasPostedWithCorrectName
{
    XCTestExpectation *expectation = [[XCTNSNotificationExpectation alloc] initWithName:@"name"];
    [TWTRNotificationCenter postNotificationName:@"name" tweet:self.tweet userInfo:nil];
    [self waitForExpectations:@[expectation] timeout:1.0];
}

- (void)testNotificationWasBroadcasted
{
    XCTNSNotificationExpectation *expectation = [[XCTNSNotificationExpectation alloc] initWithName:@"name" object:nil];
    [TWTRNotificationCenter postNotificationName:@"name" tweet:self.tweet userInfo:nil];
    [self waitForExpectations:@[expectation] timeout:1.0];
}

- (void)testNotificationWasPostedWithTweet
{
    XCTNSNotificationExpectation *expectation = [[XCTNSNotificationExpectation alloc] initWithName:@"name"];
    expectation.handler = ^(NSNotification *notification) {
        XCTAssertNil(notification.object);
        XCTAssertNotNil(notification.userInfo);
        TWTRTweet *tweet = notification.userInfo[TWTRNotificationInfoTweet];
        XCTAssertTrue([tweet isKindOfClass:[TWTRTweet class]]);
        XCTAssertEqualObjects(@"266031293945503744", tweet.tweetID);
        return YES;
    };
    [TWTRNotificationCenter postNotificationName:@"name" tweet:self.tweet userInfo:nil];
    [self waitForExpectations:@[expectation] timeout:1.0];
}

@end
