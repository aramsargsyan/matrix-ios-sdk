/*
 Copyright 2017 Vector Creations Ltd

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "MXUIKitBackgroundModeHandler.h"
#import "UIApplication+MatrixSDK.h"

#if TARGET_OS_IPHONE

#import <UIKit/UIKit.h>

@implementation MXUIKitBackgroundModeHandler

#pragma mark - MXBackgroundModeHandler

- (NSUInteger)invalidIdentifier
{
    return UIBackgroundTaskInvalid;
}

- (NSUInteger)startBackgroundTask
{
    return [self startBackgroundTaskWithName:nil completion:nil];
}

- (NSUInteger)startBackgroundTaskWithName:(NSString *)name completion:(void(^)())completion
{
    if (name)
    {
        return [[UIApplication mx_sharedApplication] beginBackgroundTaskWithName:name expirationHandler:completion];
    }
    return [[UIApplication mx_sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
}

- (void)endBackgrounTaskWithIdentifier:(NSUInteger)identifier
{
    [[UIApplication mx_sharedApplication] endBackgroundTask:identifier];
}

@end

#endif
