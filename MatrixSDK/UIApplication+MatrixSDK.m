/*
 Copyright 2017 Aram Sargsyan
 
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

#import "UIApplication+MatrixSDK.h"

@implementation UIApplication (MatrixSDK)

+ (instancetype)mx_sharedApplication
{
#ifndef MX_APP_EXTENSIONS
    return [UIApplication sharedApplication];
#else
    return nil;
#endif
}

- (BOOL)mx_openURL:(NSURL*)url
{
#ifndef MX_APP_EXTENSIONS
    return [self openURL:url];
#else
    return NO;
#endif
}

- (BOOL)mx_canOpenURL:(NSURL *)url
{
#ifndef MX_APP_EXTENSIONS
    return [self canOpenURL:url];
#else
    return NO;
#endif
}

@end
