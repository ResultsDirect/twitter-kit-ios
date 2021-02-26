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

#import <AVFoundation/AVFoundation.h>
#import <Accounts/Accounts.h>
#import <CoreMedia/CoreMedia.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#if __IPHONE_OS_VERSION_MIN_REQUIRED > 20000 && __IPHONE_OS_VERSION_MIN_REQUIRED < 90000
#warning "TwitterKit doesn't support iOS 8.x and lower. Please, change your minimum deployment target to iOS 9.0"
#endif

#import <TwitterKit/TWTRAPIErrorCode.h>
#import <TwitterKit/TWTRAuthConfig.h>
#import <TwitterKit/TWTRAuthSession.h>
#import <TwitterKit/TWTRConstants.h>
#import <TwitterKit/TWTRCoreOAuthSigning.h>
#import <TwitterKit/TWTRGuestSession.h>
#import <TwitterKit/TWTRSession.h>
#import <TwitterKit/TWTRSessionStore.h>

#import <TwitterKit/TWTRAPIClient.h>
#import <TwitterKit/TWTRCollectionTimelineDataSource.h>
#import <TwitterKit/TWTRComposer.h>
#import <TwitterKit/TWTRComposerViewController.h>
#import <TwitterKit/TWTRJSONConvertible.h>
#import <TwitterKit/TWTRListTimelineDataSource.h>
#import <TwitterKit/TWTRLogInButton.h>
#import <TwitterKit/TWTRMediaEntitySize.h>
#import <TwitterKit/TWTRNotificationConstants.h>
#import <TwitterKit/TWTROAuthSigning.h>
#import <TwitterKit/TWTRSearchTimelineDataSource.h>
#import <TwitterKit/TWTRTimelineCursor.h>
#import <TwitterKit/TWTRTimelineDataSource.h>
#import <TwitterKit/TWTRTimelineDelegate.h>
#import <TwitterKit/TWTRTimelineFilter.h>
#import <TwitterKit/TWTRTimelineType.h>
#import <TwitterKit/TWTRTimelineViewController.h>
#import <TwitterKit/TWTRTweet.h>
#import <TwitterKit/TWTRTweetCashtagEntity.h>
#import <TwitterKit/TWTRTweetEntity.h>
#import <TwitterKit/TWTRTweetHashtagEntity.h>
#import <TwitterKit/TWTRTweetTableViewCell.h>
#import <TwitterKit/TWTRTweetUrlEntity.h>
#import <TwitterKit/TWTRTweetUserMentionEntity.h>
#import <TwitterKit/TWTRTweetView.h>
#import <TwitterKit/TWTRTweetViewDelegate.h>
#import <TwitterKit/TWTRTwitter.h>
#import <TwitterKit/TWTRUser.h>
#import <TwitterKit/TWTRUserTimelineDataSource.h>
#import <TwitterKit/TWTRVideoMetaData.h>
#import <TwitterKit/TWTRVideoPlaybackState.h>
