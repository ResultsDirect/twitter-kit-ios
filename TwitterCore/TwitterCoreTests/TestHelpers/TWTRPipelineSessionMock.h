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

@class TWTRGuestSession;
@class TWTRSession;
@class TWTRAuthConfig;
@import TwitterKit;

@interface TWTRPipelineSessionMock : NSObject <TWTRSessionStore>

@property (nonatomic) TWTRAuthConfig *authConfig;

@property (nonatomic) TWTRSession *userSession;
@property (nonatomic) TWTRGuestSession *guestSession;

@property (nonatomic) id refreshSession;
@property (nonatomic) NSError *refreshError;

@property (nonatomic) NSInteger guestSessionFetchCount;
@property (nonatomic) NSInteger userSessionFetchCount;

@property (nonatomic) NSError *error;

@end
