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
#import <XCTest/XCTest.h>
#import <TwitterKit/TWTRMobileSSO.h>
#import "TWTRTestSessionStore.h"

@interface TWTRMobileSSOTests : XCTestCase

@property (nonatomic) id<TWTRSessionStore> store;
@property (nonatomic) TWTRMobileSSO *mobileSSO;
@end

@implementation TWTRMobileSSOTests

- (void)setUp
{
    [super setUp];

    self.store = [[TWTRTestSessionStore alloc] initWithUserSessions:@[] guestSession:nil];
    self.mobileSSO = [[TWTRMobileSSO alloc] initWithSessionStore:self.store];
}

#pragma mark - Process Redirect

- (void)testProcessURL_returnsYesForSuccess
{
    NSURL *successURL = [NSURL URLWithString:@"twitterkit-consumer://secret=RVfziSc&token=23698-mzYEJHqJ&username=fabric_tester"];
    XCTAssertTrue([self.mobileSSO processRedirectURL:successURL]);
}

- (void)testProcessURL_returnsYesForCancel
{
    NSURL *cancelURL = [NSURL URLWithString:@"twitterkit-consumer://"];
    self.mobileSSO.completion = ^(TWTRSession *_Nullable session, NSError *_Nullable error) {
    };
    XCTAssertTrue([self.mobileSSO processRedirectURL:cancelURL]);
}

- (void)testProcessURL_returnsNoForSafariURL
{
    NSURL *safariURL = [NSURL URLWithString:@"twitterkit-consumer://oauth_verifier=238932u8"];
    XCTAssertFalse([self.mobileSSO processRedirectURL:safariURL]);
}

- (void)testProcessURL_savesCorrectSession
{
    NSURL *successURL = [NSURL URLWithString:@"twitterkit-consumer://secret=RVfziSc&token=23698-mzYEJHqJ&username=fabric_tester"];

    XCTestExpectation *token = [self expectationWithDescription:@"Token is correct"];
    XCTestExpectation *secret = [self expectationWithDescription:@"Secret is correct"];

    self.mobileSSO.completion = ^(TWTRSession *session, NSError *error) {
        if ([session.authToken isEqualToString:@"23698-mzYEJHqJ"]) {
            [token fulfill];
        }
        if ([session.authTokenSecret isEqualToString:@"RVfziSc"]) {
            [secret fulfill];
        }
    };
    [self.mobileSSO processRedirectURL:successURL];

    [self waitForExpectations:@[token, secret] timeout:0.5];
}

#pragma mark - Test Source Application Verification

- (void)testVerifySourceApplication_validDomains
{
    XCTAssertTrue([self.mobileSSO isSSOWithSourceApplication:@"com.twitter.dogfood.internal"]);
    XCTAssertTrue([self.mobileSSO isSSOWithSourceApplication:@"com.atebits.tweetie2"]);
}

- (void)testVerifySourceApplication_invalidDomain
{
    XCTAssertFalse([self.mobileSSO isSSOWithSourceApplication:@"com.otherapp.appname"]);
}

@end
